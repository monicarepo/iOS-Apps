//
//  LanguageSelectionView.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import SwiftUI

public struct LanguageSelectionView: View {
    @Environment(LanguageSetting.self) var languageSetting
    @EnvironmentObject var appState: AppState

    @State private var selectedLanguage: SupportedLanguage = .english
    public var body: some View {
        VStack {
            ForEach(SupportedLanguage.allCases, id: \.self) { language in
                Button {
                    selectedLanguage = language
                } label: {
                    HStack {
                        Text(language.rawValue)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                        if selectedLanguage == language {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .foregroundColor(Color.customColor.primaryOrangeColor)
                        }
                    }
                }
            }

            Spacer()

            Button {
                languageSetting.setLocale(language: selectedLanguage)
                appState.homeNavDestination.removeLast()
            } label: {
                Text("settings-save-changes")
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.customColor.primaryOrangeColor)
            .padding()
        }.onAppear {
            selectedLanguage = languageSetting.currentSelectedLanguage
        }
        .navigationBarTitle("settings-title", displayMode: .inline)
    }
}
