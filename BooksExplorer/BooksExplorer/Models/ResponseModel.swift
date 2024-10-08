//
//  ResponseModel.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import Foundation

struct ResponseModel: Codable {
    let total: Int
    let items: [Book]

    enum CodingKeys: String, CodingKey {
        case total = "num_found"
        case items = "docs"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.total = try container.decode(Int.self, forKey: .total)
        self.items = try container.decode([Book].self, forKey: .items)
    }
}
