//
//  ChapterDetails.swift
//  Sample
//
//  Created by Moni on 05/09/25.
//

import SwiftUI

struct ChapterDetails: View {
    var homeViewModel: HomeViewModel
    @Injected private var logger: LoggerType

    var body: some View {
        ScrollView {
            VStack {
                if homeViewModel.isChapterViewLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    VStack {
                        if let chapter = homeViewModel.chapterBook {
                            Text("Chapter \(chapter.chapterNum) - \(chapter.book)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()

                            // Chapter content
                            ForEach(chapter.chapterText, id: \.self) { paragraph in
                                Text(paragraph)
                                    .font(.body)
                                    .padding(.bottom, 10)
                            }
                        } else {
                            Text("No Chapter Found")
                        }
                    }
                }
            }.onAppear {
                homeViewModel.loadChapterIfNeeded()
            }
            .navigationBarTitle("Chapter Details", displayMode: .inline)
        }
    }
}
