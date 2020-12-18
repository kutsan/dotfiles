var opts = {
	command_on_image_loaded: '',
	command_on_non_image_loaded: ''
}
mp.options.read_options(opts)

var wasImage = false
var frameCount = null
var audioTracks = null
var outParamsReady = null
var path = null

function stateChanged() {
	function setImage(isImage) {
		if (isImage && !wasImage && opts.command_on_image_loaded !== '') {
			mp.command(opts.command_on_image_loaded)
		}

		if (!isImage && wasImage && opts.command_on_non_image_loaded !== '') {
			mp.command(opts.command_on_non_image_loaded)
		}

		wasImage = isImage
	}

	if (path !== null && audioTracks !== null) {
		if (frameCount === null && audioTracks > 0) {
			setImage(false)
		} else if (outParamsReady && frameCount !== null) {
			// PNGs have 0 frames whilst JPGs have 1.
			setImage(
				(frameCount === 0 || frameCount === 1) && audioTracks === 0
			)
		}
	}
}

mp.observe_property('video-out-params/par', 'number', function (_, val) {
	outParamsReady = { outParamsReady: val !== null && val > 0 }

	stateChanged()
})

mp.observe_property('estimated-frame-count', 'number', function (_, val) {
	frameCount = val

	stateChanged()
})

mp.observe_property('path', 'string', function (_, val) {
	if (!val || val === '') {
		path = null
	} else {
		path = val
	}

	stateChanged()
})

mp.register_event('tracks-changed', function () {
	audioTracks = 0
	var tracks = 0

	var trackList = mp.get_property_native('track-list')

	for (var i in trackList) {
		tracks = tracks + 1

		if (trackList[i].type === 'audio') {
			audioTracks = audioTracks + 1
		}
	}

	if (tracks === 0) {
		audioTracks = null
	}

	stateChanged()
})
