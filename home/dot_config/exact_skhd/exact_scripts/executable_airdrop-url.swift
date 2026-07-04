#!/usr/bin/env swift

import AppKit

guard let arg = CommandLine.arguments.dropFirst().first,
      let url = URL(string: arg) else {
    exit(2)
}

guard let service = NSSharingService(named: .sendViaAirDrop) else {
    exit(1)
}

final class AirDropCompletionHandler: NSObject, NSSharingServiceDelegate {
    func sharingService(_: NSSharingService, didShareItems _: [Any]) {
        NSApp.terminate(nil)
    }

    func sharingService(_: NSSharingService, didFailToShareItems _: [Any], error _: Error) {
        NSApp.terminate(nil)
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.accessory)

let handler = AirDropCompletionHandler()
service.delegate = handler
service.perform(withItems: [url])

app.run()
