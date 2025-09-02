//
//  FirebaseAnalyticsManager.swift
//  Sample
//
//  Created by Moni on 02/09/25.
//

import FirebaseAnalytics
import Foundation

final class FirebaseAnalyticsManager: AnalyticsEventLoggerProtocol {
    func initialize() {}

    func logEvent(event: EventProtocol) {
        Analytics.logEvent(event.name, parameters: event.param)
    }
}
