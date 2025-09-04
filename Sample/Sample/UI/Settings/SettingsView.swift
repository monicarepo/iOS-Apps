//
//  SettingsView.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(LanguageSetting.self) var languageSetting
    @EnvironmentObject var appState: AppState
    var body: some View {
        VStack {
            HStack {
                Text("settings-language")
                    .padding()
                Spacer()
            }
            .frame(height: 40)
            .background(Color.customColor.secondaryOrangeColor)
            .padding(.vertical)

            Button {
                appState.homeNavDestination.append(.languageSelection)
            } label: {
                HStack {
                    Text(languageSetting.currentSelectedLanguage == .english ? "onboarding_english" : "onboarding_tamil")
                        .padding()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .padding()
                }
                .border(Color.black, width: 1)
                .padding()
            }

            Spacer()
        }
        .navigationBarTitle("settings-title", displayMode: .inline)
    }
}
