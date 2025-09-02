//
//  ConfigurationManager.swift
//  Sample
//
//  Created by Moni on 01/09/25.
//

import Foundation

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingValue, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingValue
        }

        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum API {
    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

enum ConfigurationManager {
    enum Environment {
        case dev
        case qa
        case prod
    }

    static var environment: Environment {
        #if DEV
            return .dev
        #elseif QA
            return .qa
        #else
            return .prod
        #endif
    }
}
