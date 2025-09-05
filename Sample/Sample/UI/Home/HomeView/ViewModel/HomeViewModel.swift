//
//  HomeViewModel.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Combine
import Foundation

@Observable class HomeViewModel {
    var chapters: Chapters = []
    var chapter: Chapter?
    private let chaptersRepository: ChaptersRepository

    private var cancellables = Set<AnyCancellable>()

    init(chaptersRepository: ChaptersRepository) {
        self.chaptersRepository = chaptersRepository
    }

    func fetchChapters() {
        chaptersRepository.fetchChapters().sink { completion in
            switch completion {
            case let .failure(error):
                print("******* Error: \(error)")
            case .finished:
                print("******* API call finished")
            }
        } receiveValue: { chapters in
            self.chapters = chapters
        }.store(in: &cancellables)
    }

    func getChapter() {
        chaptersRepository.fetchChapter(bookId: "1", chapterId: "1").sink { completion in
            switch completion {
            case let .failure(error):
                print("******* Error: \(error)")
            case .finished:
                print("******* API call finished")
            }
        } receiveValue: { chapter in
            print("******* chapter: \(chapter)")
//            self.chapter = chapter
        }.store(in: &cancellables)
    }
}
