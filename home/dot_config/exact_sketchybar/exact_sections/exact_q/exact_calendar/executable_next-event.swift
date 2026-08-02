#!/usr/bin/env swift

import EventKit
import Foundation

guard let lookaheadArgument = CommandLine.arguments.dropFirst().first,
      let lookaheadMinutes = Int(lookaheadArgument),
      lookaheadMinutes > 0 else {
    exit(3)
}

func isDeclined(_ event: EKEvent) -> Bool {
    event.attendees?.contains {
        $0.isCurrentUser && $0.participantStatus == .declined
    } ?? false
}

func sanitized(_ title: String?) -> String {
    (title ?? "Untitled")
        .replacingOccurrences(of: "\t", with: " ")
        .replacingOccurrences(of: "\n", with: " ")
        .trimmingCharacters(in: .whitespaces)
}

let store = EKEventStore()
let authorization = DispatchSemaphore(value: 0)
var isAuthorized = false

let handleAccessResponse: (Bool, Error?) -> Void = { granted, _ in
    isAuthorized = granted
    authorization.signal()
}

if #available(macOS 14.0, *) {
    store.requestFullAccessToEvents(completion: handleAccessResponse)
} else {
    store.requestAccess(to: .event, completion: handleAccessResponse)
}

guard authorization.wait(timeout: .now() + 10) == .success, isAuthorized else {
    exit(2)
}

let now = Date()
let horizon = now.addingTimeInterval(TimeInterval(lookaheadMinutes * 60))

let predicate = store.predicateForEvents(withStart: now, end: horizon, calendars: nil)

let upcoming = store.events(matching: predicate)
    .filter { !$0.isAllDay }
    .filter { $0.endDate > now }
    .filter { $0.status != .canceled }
    .filter { !isDeclined($0) }
    .sorted { $0.startDate < $1.startDate }

guard let next = upcoming.first else {
    exit(1)
}

let minutesUntilStart = Int((next.startDate.timeIntervalSince(now) / 60).rounded(.down))

print("\(minutesUntilStart)\t\(sanitized(next.title))")
