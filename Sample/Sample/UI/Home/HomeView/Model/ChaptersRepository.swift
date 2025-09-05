//
//  ChaptersRepository.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Combine
import Foundation
import NetworkLibrary

protocol ChaptersRepository {
    func fetchChapters() -> AnyPublisher<Chapters, APIError>
    func fetchChapter(bookId: String, chapterId: String) -> AnyPublisher<Chapter, APIError>
}

class ChaptersRepositoryImpl: ChaptersRepository {
//    private network: NetworkManager
//
//    init(network: NetworkManager) {
//        self.network = network
//    }

    @Injected private var network: NetworkManager

    func fetchChapters() -> AnyPublisher<Chapters, APIError> {
        guard let baseUrl = URL(string: ConfigurationManager.shared.baseURL) else {
            return Fail(error: APIError.urlError).eraseToAnyPublisher()
        }
        print("********* BASE URL: \(baseUrl)")
        let request = RequestBuilder(baseURL: baseUrl, path: Endpoints.chapters.path)
        request.set(headers: Headers.defaultHeaders)
        request.set(method: .get)
        return network.makeRequest(with: request, type: Chapters.self)
    }

    func fetchChapter(bookId: String, chapterId: String) -> AnyPublisher<Chapter, APIError> {
        guard let baseUrl = URL(string: ConfigurationManager.shared.baseURL) else {
            return Fail(error: APIError.urlError).eraseToAnyPublisher()
        }
        let request = RequestBuilder(baseURL: baseUrl, path: Endpoints.chapter(bookNumber: bookId, chapterNumber: chapterId).path)
        request.set(headers: Headers.defaultHeaders)
        request.set(method: .get)
        return network.makeRequest(with: request, type: Chapter.self)
    }
}
