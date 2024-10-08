//
//  FetchService.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
    }

    private let baseUrl = URL(string: Constants.searchUrl)!

    func searchBook(by bookName: String, limit: Int = 10, page: Int = 1)
        async throws -> ResponseModel
    {
        let queryItems = [
            URLQueryItem(name: "title", value: bookName),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "page", value: "\(page)"),
        ]
        let fetchUrl = baseUrl.appending(queryItems: queryItems)
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        guard let response = response as? HTTPURLResponse,
            response.statusCode == 200
        else {
            throw FetchError.badResponse
        }
        let books = try JSONDecoder().decode(ResponseModel.self, from: data)
        return books
    }
}
