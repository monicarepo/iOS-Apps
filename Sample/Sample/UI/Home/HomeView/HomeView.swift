//
//  HomeView.swift
//  Sample
//
//  Created by Moni on 03/09/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationStack(path: $appState.homeNavDestination) {
            VStack {
                Text("HomeView")
                    .font(.title)
                NavigationLink(value: HomeNavDestination.details) {
                    Text("Open Details")
                }
            }
            .navigationDestination(for: HomeNavDestination.self) { destination in
                switch destination {
                case .details:
                    Text("Details")
//                    DetailsView()
                }
            }
        }
    }
}
