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
    @Injected private var logger: LoggerType

    var body: some View {
        NavigationStack(path: $appState.homeNavDestination) {
            VStack {
                if homeViewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    List(homeViewModel.chapters, id: \.self) { item in
                        HStack {
                            Text(item.book)
                                .font(.title3)
                                .fontWeight(.medium)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .padding()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture { _ in
                            homeViewModel.selectedBookId = String(item.id)
                            homeViewModel.selectedChapterId = "1"
                            appState.homeNavDestination.append(.chapterDetails)
                        }
                    }
                }
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
                case .chapterDetails:
                    ChapterDetails(homeViewModel: homeViewModel)
                }
            }
            .onAppear {
                logger.debug("HomeView.onAppear")
                homeViewModel.loadBookIfNeeded()
            }
        }
    }
}
