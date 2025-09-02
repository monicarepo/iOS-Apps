//
//  AnalyticsManager.swift
//  Sample
//
//  Created by Moni on 02/09/25.
//

import Foundation

protocol EventProtocol {
    var name: String { get }
    var param: [String: Any] { get }
}

enum AnalyticsEvent {
    case clickButtonEvent
    case viewScreenEvent(name: String)
}

enum OnboardingEvent {
    case clickButtonEvent
    case nextButtonTapped(index: Int)
}

extension AnalyticsEvent: EventProtocol {
    var name: String {
        switch self {
        case .clickButtonEvent:
            return "click_button_event"
        case let .viewScreenEvent(name: name):
            return "view_screen_event_\(name)"
        }
    }

    var param: [String: Any] {
        switch self {
        case .clickButtonEvent:
            return [:]
        case let .viewScreenEvent(name: name):
            return ["screen_name": name]
        }
    }
}

extension OnboardingEvent: EventProtocol {
    var name: String {
        switch self {
        case .clickButtonEvent:
            return "click_button_event"
        case let .nextButtonTapped(index: index):
            return "next_button_tapped_event_\(index)"
        }
    }

    var param: [String: Any] {
        switch self {
        case .clickButtonEvent:
            return [:]
        case let .nextButtonTapped(index: index):
            return ["index": index]
        }
    }
}

protocol AnalyticsEventLoggerProtocol {
    func initialize()
    func logEvent(event: EventProtocol)
}

protocol AnalyticsManagerProtocol {
    func logEvent(event: EventProtocol)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    private let logger: AnalyticsEventLoggerProtocol

    init(logger: AnalyticsEventLoggerProtocol) {
        self.logger = logger
    }

    func logEvent(event: EventProtocol) {
        logger.logEvent(event: event)
    }
}
