//
//  Chapters.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Foundation

struct Chapter: Codable, Hashable {
    let id: Int
    let type: TypeEnum
    let book: String
}

enum TypeEnum: String, Codable {
    case newTestament = "New Testament"
    case oldTestament = "Old Testament"
}

typealias Chapters = [Chapter]

struct ChapterBook: Codable {
    let book: String
    let bookID, chapterNum: Int
    let chapterText: [String]

    enum CodingKeys: String, CodingKey {
        case book
        case bookID = "book_id"
        case chapterNum = "chapter_num"
        case chapterText = "chapter_text"
    }
}
