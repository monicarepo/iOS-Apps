//
//  Headers.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Foundation

class Headers {
    static var defaultHeaders: [String: String] {
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "x-rapidapi-key": ConfigurationManager.shared.rapidAPIKey,
            "x-rapidapi-host": ConfigurationManager.shared.rapidAPIHost,
        ]
        return headers
    }
}
