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
        case let .chapter(bookNumber: bookNumber, chapterNumber: chapterNumber):
            return "/bible/chapter?book_id=\(bookNumber)&chapter_num=\(chapterNumber)"
        case let .verses(bookNumber: bookNumber, chapterNumber: chapterNumber, versesNumberFrom: versesNumberFrom, versesNumberTo: versesNumberTo):
            return "/bible/verse?book_id=\(bookNumber)&chapter_num=\(chapterNumber)&verse_from=\(versesNumberFrom)&verse_to=\(versesNumberTo)"
        }
    }
}
