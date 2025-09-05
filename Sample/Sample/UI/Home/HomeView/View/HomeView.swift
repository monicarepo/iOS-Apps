//
//  HomeView.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    var homeViewModel: HomeViewModel
    var body: some View {
        NavigationStack(path: $appState.homeNavDestination) {
            VStack {
//                Text("HomeView")
//                    .font(.title)
//                NavigationLink(value: HomeNavDestination.details) {
//                    Text("Open Details")
//                }
            }
            .navigationTitle(Text("app_title"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        appState.homeNavDestination.append(.settings)
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationDestination(for: HomeNavDestination.self) { destination in
                switch destination {
                case .settings:
                    SettingsView()
                case .languageSelection:
                    LanguageSelectionView()
                }
            }
            .onAppear {
                homeViewModel.getChapter()
            }
        }
    }
}
