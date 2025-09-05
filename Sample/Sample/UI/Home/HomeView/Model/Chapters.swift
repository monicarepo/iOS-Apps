//
//  Chapters.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Foundation

struct Chapter: Codable {
    let id: Int
    let type: TypeEnum
    let book: String
}

enum TypeEnum: String, Codable {
    case newTestament = "New Testament"
    case oldTestament = "Old Testament"
}

typealias Chapters = [Chapter]
