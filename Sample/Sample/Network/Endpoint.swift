//
//  Endpoint.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Foundation

enum Endpoints {
    case chapters
    case chapter(bookNumber: String, chapterNumber: String)
    case verses(bookNumber: String, chapterNumber: String, versesNumberFrom: String, versesNumberTo: String)
}

extension Endpoints {
    var path: String {
        switch self {
        case .chapters:
            return "/bible/books"
        case let .chapter(bookNumber: bookNumber,
                          chapterNumber: chapterNumber):
            return "/bible/chapter"
        case let .verses(bookNumber,
                         chapterNumber,
                         versesNumberFrom,
                         versesNumberTo):
            return "/bible/verse"
        }
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .chapters:
            return nil
        case let .chapter(bookNumber: bookNumber, chapterNumber: chapterNumber):
            return [
                URLQueryItem(name: "book_id", value: bookNumber),
                URLQueryItem(name: "chapter_num", value: chapterNumber),
            ]
        case let .verses(bookNumber: bookNumber, chapterNumber: chapterNumber, versesNumberFrom: versesNumberFrom, versesNumberTo: versesNumberTo):
            return [
                URLQueryItem(name: "book_id", value: "\(bookNumber)"),
                URLQueryItem(name: "chapter_num", value: "\(chapterNumber)"),
                URLQueryItem(name: "verse_from", value: "\(versesNumberFrom)"),
                URLQueryItem(name: "verse_to", value: "\(versesNumberTo)"),
            ]
        }
    }
}
