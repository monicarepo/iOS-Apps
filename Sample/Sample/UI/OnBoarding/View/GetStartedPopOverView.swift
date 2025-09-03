//
//  GetStartedPopOverView.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import SwiftUI

struct GetStartedPopOverView: View {
    @Binding var showPopup: Bool
    @State private var selectedIndex = 0

    var body: some View {
        VStack {
            Image("abc")
                .frame(width: 120, height: 150)
            Text(L10n.onboardingChooseLanguage)
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, 40)

            Text(L10n.onboardingChangeLatter)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            VStack(spacing: 20) {
                RadioButtonView(index: 0, text: L10n.onboardingEnglish, selectedIndex: $selectedIndex)
                RadioButtonView(index: 1, text: L10n.onboardingTamil, selectedIndex: $selectedIndex)
            }.padding(.all, 40)

            Button {
                showPopup = false
            } label: {
                Text(L10n.onboadingLetsGo)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .cornerRadius(4)
            }
            .background(Color.orange)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.vertical, 40)
    }
}

struct RadioButtonView: View {
    var index: Int
    var text: String
    @Binding var selectedIndex: Int

    var body: some View {
        Button {
            selectedIndex = index
        } label: {
            HStack {
                /* Image(systemName: selectedIndex == index ? "checkmark.circle.fill" : "circle") */
                Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(selectedIndex == index ? .orange : .gray)
                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
            }.padding(.horizontal, 50)
                .frame(maxWidth: .infinity)
        }
    }
}
