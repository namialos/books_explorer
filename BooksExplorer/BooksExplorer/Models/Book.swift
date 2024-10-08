//
//  Book.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import Foundation

struct Book: Codable, Identifiable {
    var id = UUID()
    var title: String
    var authorName: [String]?
    var firstPublishYear: Int?
    var coverId: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case authorName = "author_name"
        case firstPublishYear = "first_publish_year"
        case coverId = "cover_i"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.authorName = try container.decodeIfPresent(
            [String].self, forKey: .authorName)
        self.firstPublishYear = try container.decodeIfPresent(
            Int.self, forKey: .firstPublishYear)
        self.coverId = try container.decodeIfPresent(Int.self, forKey: .coverId)
    }
}
