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
    var chapterBook: ChapterBook?
    private let chaptersRepository: ChaptersRepository
    var isLoading: Bool = false
    var isChapterViewLoading: Bool = false
    var selectedBookId: String = "1"
    var selectedChapterId: String = "1"

    private var cancellables = Set<AnyCancellable>()

    init(chaptersRepository: ChaptersRepository) {
        self.chaptersRepository = chaptersRepository
        // fetchChapters()
    }

    func setChapterBook() {
        isChapterViewLoading = true
        chapterBook = ChapterBook(book: "Genesis", bookID: 2, chapterNum: 1, chapterText: ["Hello World"])
        isChapterViewLoading = false
    }

    func setBooks() {
        isLoading = true
        chapters = [
            Chapter(id: 1, type: .oldTestament, book: "Genesis"),
            Chapter(id: 2, type: .oldTestament, book: "Exodus"),
            Chapter(id: 3, type: .oldTestament, book: "Leviticus"),
            Chapter(id: 4, type: .oldTestament, book: "Numbers"),
            Chapter(id: 4, type: .oldTestament, book: "Deuteronomy"),
        ]
        isLoading = false
    }

    func loadChapterIfNeeded() {
        print("******* loadChapterIfNeeded: \(selectedBookId)")
        guard chapterBook == nil, !isChapterViewLoading else {
            if chapterBook?.bookID != Int(selectedBookId) {
                getChapter()
            } else {
                return
            }
            return
        }
        getChapter()
//        setChapterBook()
    }

    func loadBookIfNeeded() {
        print("******* loadBookIfNeeded: \(selectedBookId)")
        guard chapters.isEmpty, !isLoading else { return }
        fetchChapters()
//        setBooks()
    }

    func fetchChapters() {
        isLoading = true
        chaptersRepository.fetchChapters().sink { [weak self] completion in
            guard let self else { return }
            self.isLoading = false
            switch completion {
            case let .failure(error):
                print("******* fetchChapters Error: \(error)")
            case .finished:
                print("******* fetchChapters API call finished")
            }
        } receiveValue: { [weak self] chapters in
            guard let self else { return }
            self.chapters = chapters
            self.isLoading = false
            // print("******* chapter: \(chapters)")
        }.store(in: &cancellables)
    }

    func getChapter() {
        isChapterViewLoading = true
        chaptersRepository.fetchChapter(bookId: selectedBookId, chapterId: selectedChapterId)
            .sink { [weak self] completion in
                guard let self else { return }
                self.isChapterViewLoading = false
                switch completion {
                case let .failure(error):
                    print("******* getChapter Error: \(error)")
                case .finished:
                    print("******* getChapter API call finished")
                }
            } receiveValue: { [weak self] chapter in
                guard let self else { return }
                self.chapterBook = chapter
                self.isChapterViewLoading = false
                print("******* chapter: \(chapter)")
            }.store(in: &cancellables)
    }
}
