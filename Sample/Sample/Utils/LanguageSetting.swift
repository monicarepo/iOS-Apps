//
//  LanguageSetting.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import Foundation

@Observable
class LanguageSetting {
    enum Constants: String {
        case languageKey = "language-key"
        case appleLanguages = "AppleLanguages"
    }

    var locale: Locale = .current {
        didSet {}
    }

    init() {
        setUpInitialLocale()
    }

    private func setUpInitialLocale() {
        if let language = UserDefaults.standard.string(forKey: Constants.languageKey.rawValue), let value = SupportedLanguage(rawValue: language) {
            setLocale(language: value)
        } else {
            // First time user -> read the language from phone settings
            guard let languages = UserDefaults.standard.stringArray(forKey: Constants.appleLanguages.rawValue), let currentLanguage = languages.first as String? else { return }
            if currentLanguage.contains("ta") {
                setLocale(language: .tamil)
            } else {
                setLocale(language: .english)
            }
        }
    }

    func setLocale(language: SupportedLanguage) {
        switch language {
        case .english:
            locale = Locale(identifier: "en")
            UserDefaults.standard.setValue(SupportedLanguage.english.rawValue, forKey: Constants.languageKey.rawValue)
            UserDefaults.standard.synchronize()
        case .tamil:
            locale = Locale(identifier: "ta")
            UserDefaults.standard.setValue(SupportedLanguage.tamil.rawValue, forKey: Constants.languageKey.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
