//
//  ViewModel.swift
//  Sample
//
//  Created by Moni on 31/08/25.
//

import Foundation

class ViewModel: ObservableObject {
    // Dependency Injection
//    private var logger: LoggerType = Injection.shared.container.resolve(LoggerType.self)!
    @Injected private var logger: LoggerType

    func onAppear() {
        logger.info("ContentView View is loaded")
    }
}
