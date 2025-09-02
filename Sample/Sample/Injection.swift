//
//  Injection.swift
//  Sample
//
//  Created by Moni on 01/09/25.
//

import Foundation
import Swinject

final class Injection {
    static let shared = Injection()
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }

        set {
            _container = newValue
        }
    }

    private var _container: Container?

    private func buildContainer() -> Container {
        let container = Container()
        container.register(LoggerType.self) { _ in
            Logger()
        }
        return container
    }
}

@propertyWrapper struct Injected<Dependency> {
    let wrappedValue: Dependency

    init() {
        wrappedValue = Injection.shared.container.resolve(Dependency.self)!
    }
}
