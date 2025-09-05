//
//  SampleTabView.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import Foundation
import SwiftUI

struct SampleTableView: View {
    @StateObject private var appState = AppState()

    var body: some View {
        TabView(selection: createtabBinding()) {
            HomeView(homeViewModel: HomeViewModel(chaptersRepository: ChaptersRepositoryImpl()))
                .tag(ViewTab.home)
                .tabItem {
                    Image(systemName: "house")
                    Text("tabview_home")
                }
            SavedView()
                .tag(ViewTab.saved)
                .tabItem {
                    Image(systemName: "folder")
                    Text("tabview_saved")
                }
            AboutView()
                .tag(ViewTab.about)
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("tabview_about")
                }
        }
        .accentColor(Color.customColor.primaryOrangeColor)
        .environmentObject(appState)
    }

    private func createtabBinding() -> Binding<ViewTab> {
        Binding<ViewTab>(
            get: {
                appState.selectedTab
            },
            set: { selectedTab in
                if selectedTab == appState.selectedTab {
                    switch selectedTab {
                    case .home:
                        if !appState.homeNavDestination.isEmpty {
                            withAnimation {
                                appState.homeNavDestination.removeAll()
                            }
                        }
                    case .saved:
                        if !appState.savedNavDestination.isEmpty {
                            withAnimation {
                                appState.savedNavDestination.removeAll()
                            }
                        }
                    case .about:
                        if !appState.aboutNavDestination.isEmpty {
                            withAnimation {
                                appState.aboutNavDestination.removeAll()
                            }
                        }
                    }
                }
                appState.selectedTab = selectedTab
            }
        )
    }
}

class AppState: ObservableObject {
    @Published var selectedTab: ViewTab = .home
    @Published var homeNavDestination: [HomeNavDestination] = []
    @Published var savedNavDestination: [SavedNavDestination] = []
    @Published var aboutNavDestination: [AboutNavDestination] = []
}

enum ViewTab {
    case home
    case saved
    case about
}

enum HomeNavDestination {
    case settings
    case languageSelection
}

enum SavedNavDestination {
    case details
}

enum AboutNavDestination {
    case details
}
