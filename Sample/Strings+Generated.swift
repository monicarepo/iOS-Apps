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
    /// Last Name
    static let lastName = L10n.tr("Localizable", "last_name", fallback: "Last Name")
    /// Middle Name
    static let middleName = L10n.tr("Localizable", "middle_name", fallback: "Middle Name")
    /// Profile
    static let profile = L10n.tr("Localizable", "profile", fallback: "Profile")
    /// Submit
    static let submit = L10n.tr("Localizable", "submit", fallback: "Submit")
    /// Success
    static let success = L10n.tr("Localizable", "success", fallback: "Success")
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
