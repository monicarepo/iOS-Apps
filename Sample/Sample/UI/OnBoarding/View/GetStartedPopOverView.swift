//
//  GetStartedPopOverView.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import SwiftUI

enum SupportedLanguage: String {
    case english = "en"
    case tamil = "ta"
}

struct GetStartedPopOverView: View {
    @Binding var showPopup: Bool
    @State private var selectedLanguage = SupportedLanguage.english
    @Environment(LanguageSetting.self) var languageSetting
    @AppStorage("onboardingLoaded") var onboardingLoaded: Bool = false

    var body: some View {
        VStack {
            Image("abc")
                .frame(width: 120, height: 150)
            Text("onboarding_choose_language")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, 40)

            Text("onboarding_change_latter")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            VStack(spacing: 20) {
                RadioButtonView(currentLanguage: .english, text: "onboarding_english", selectedLanguage: $selectedLanguage)
                RadioButtonView(currentLanguage: .tamil, text: "onboarding_tamil", selectedLanguage: $selectedLanguage)
            }.padding(.all, 40)

            Button {
                showPopup = false
                onboardingLoaded = true
            } label: {
                Text("onboading_lets_go")
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .cornerRadius(4)
            }
            .background(Color.orange)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .onChange(of: selectedLanguage) { newValue in
            languageSetting.setLocale(language: newValue)
        }
        .onAppear {
            if languageSetting.locale.identifier.contains("ta") {
                selectedLanguage = .tamil
            } else {
                selectedLanguage = .english
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.vertical, 40)
    }
}

struct RadioButtonView: View {
    var currentLanguage: SupportedLanguage
    var text: String
    @Binding var selectedLanguage: SupportedLanguage

    var body: some View {
        Button {
            selectedLanguage = currentLanguage
        } label: {
            HStack {
                /* Image(systemName: selectedIndex == index ? "checkmark.circle.fill" : "circle") */
                Image(systemName: selectedLanguage == currentLanguage ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(selectedLanguage == currentLanguage ? .orange : .gray)
                Text(LocalizedStringKey(text))
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
            }.padding(.horizontal, 50)
                .frame(maxWidth: .infinity)
        }
    }
}
