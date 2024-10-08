//
//  BookViewModel.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import Combine
import Foundation

@MainActor
class BookViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var books: [Book] = []
    @Published var isLoading = false
    private var currentPage = 1
    private var canLoadMorePages = true
    private let fetcher = FetchService()
    private var currentTask: Task<Void, Never>?
    private var totalItems: Int = 0

    func searchBooks(query: String) {
        guard !query.isEmpty else {
            currentTask?.cancel()
            resetSearch()
            isLoading = false
            return
        }
        isLoading = true
        currentTask?.cancel()
        currentTask = Task {
            do {
                let fetchedBooks = try await fetcher.searchBook(
                    by: searchQuery, page: currentPage)
                books.append(contentsOf: fetchedBooks.items)
                totalItems = fetchedBooks.total
                if books.count < totalItems {
                    currentPage += 1
                } else {
                    canLoadMorePages = false
                }
                isLoading = false
            } catch {
                print("Error fetching books: \(error)")
                isLoading = false
            }
        }
    }

    func loadMoreBooksIfNeeded(currentBook: Book) {
        guard let lastBook = books.last, lastBook.id == currentBook.id else {
            return
        }
        guard !isLoading && canLoadMorePages else { return }
        searchBooks(query: searchQuery)
    }

    func resetSearch() {
        books.removeAll()
        currentPage = 1
        canLoadMorePages = true
    }
}
