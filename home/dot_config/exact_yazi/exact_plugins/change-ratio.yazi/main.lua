--- @sync entry

local function entry(_, job)
	rt.mgr.ratio = {
		tonumber(job.args[1]),
		tonumber(job.args[2]),
		tonumber(job.args[3]),
	}

	ya.emit("app:resize", {})
end

return { entry = entry }
