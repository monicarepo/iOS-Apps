//
//  SampleApp.swift
//  Sample
//
//  Created by Moni on 31/08/25.
//

import SwiftData
import SwiftUI

@main
struct SampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("onboardingLoaded") var onboardingLoaded: Bool = false
    @State var languageSettings = LanguageSetting()

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if onboardingLoaded {
                ContentView()
                    .environment(languageSettings)
                    .environment(\.locale, languageSettings.locale)
            } else {
                OnBoardingView()
                    .environment(languageSettings)
                    .environment(\.locale, languageSettings.locale)
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
