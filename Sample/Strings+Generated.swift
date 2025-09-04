// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
enum L10n {
    /// Add
    static let add = L10n.tr("Localizable", "add", fallback: "Add")
    /// Localizable.strings
    ///   Sample
    ///
    ///   Created by Moni on 01/09/25.
    static let appName = L10n.tr("Localizable", "app_name", fallback: "Sample Application")
    /// Sample Application Chapter: %@
    static func appNameChapter(_ p1: Any) -> String {
        L10n.tr("Localizable", "app_name_chapter %@", String(describing: p1), fallback: "Sample Application Chapter: %@")
    }

    /// Title
    static let appTitle = L10n.tr("Localizable", "app_title", fallback: "Title")
    /// Cancel
    static let cancel = L10n.tr("Localizable", "cancel", fallback: "Cancel")
    /// Conform
    static let conform = L10n.tr("Localizable", "conform", fallback: "Conform")
    /// Delete
    static let delete = L10n.tr("Localizable", "delete", fallback: "Delete")
    /// Edit
    static let edit = L10n.tr("Localizable", "edit", fallback: "Edit")
    /// Error
    static let error = L10n.tr("Localizable", "error", fallback: "Error")
    /// First Name
    static let firstName = L10n.tr("Localizable", "first_name", fallback: "First Name")
    /// Get Started
    static let getStarted = L10n.tr("Localizable", "get_started", fallback: "Get Started")
    /// Last Name
    static let lastName = L10n.tr("Localizable", "last_name", fallback: "Last Name")
    /// Middle Name
    static let middleName = L10n.tr("Localizable", "middle_name", fallback: "Middle Name")
    /// Next
    static let next = L10n.tr("Localizable", "next", fallback: "Next")
    /// OK, let's go!
    static let onboadingLetsGo = L10n.tr("Localizable", "onboading_lets_go", fallback: "OK, let's go!")
    /// description 1
    static let onboardingDetail1 = L10n.tr("Localizable", "onboarding-detail-1", fallback: "description 1")
    /// description 2
    static let onboardingDetail2 = L10n.tr("Localizable", "onboarding-detail-2", fallback: "description 2")
    /// description 3
    static let onboardingDetail3 = L10n.tr("Localizable", "onboarding-detail-3", fallback: "description 3")
    /// Welcome to the sample application
    static let onboardingTitle1 = L10n.tr("Localizable", "onboarding-title-1", fallback: "Welcome to the sample application")
    /// Nice Design
    static let onboardingTitle2 = L10n.tr("Localizable", "onboarding-title-2", fallback: "Nice Design")
    /// Connect our app
    static let onboardingTitle3 = L10n.tr("Localizable", "onboarding-title-3", fallback: "Connect our app")
    /// (Don't worry, you can change it latter)
    static let onboardingChangeLatter = L10n.tr("Localizable", "onboarding_change_latter", fallback: "(Don't worry, you can change it latter)")
    /// Choose your preferred language
    static let onboardingChooseLanguage = L10n.tr("Localizable", "onboarding_choose_language", fallback: "Choose your preferred language")
    /// English
    static let onboardingEnglish = L10n.tr("Localizable", "onboarding_english", fallback: "English")
    /// Tamil
    static let onboardingTamil = L10n.tr("Localizable", "onboarding_tamil", fallback: "Tamil")
    /// Profile
    static let profile = L10n.tr("Localizable", "profile", fallback: "Profile")
    /// Skip
    static let skip = L10n.tr("Localizable", "skip", fallback: "Skip")
    /// Submit
    static let submit = L10n.tr("Localizable", "submit", fallback: "Submit")
    /// Success
    static let success = L10n.tr("Localizable", "success", fallback: "Success")
    /// About
    static let tabviewAbout = L10n.tr("Localizable", "tabview_about", fallback: "About")
    /// Home
    static let tabviewHome = L10n.tr("Localizable", "tabview_home", fallback: "Home")
    /// Saved
    static let tabviewSaved = L10n.tr("Localizable", "tabview_saved", fallback: "Saved")
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
