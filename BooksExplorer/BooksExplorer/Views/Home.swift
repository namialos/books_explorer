//
//  Home.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel = BookViewModel()

    var body: some View {
        VStack {
            HStack {
                TextField("Search books", text: $viewModel.searchQuery)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button("Search") {
                    viewModel.resetSearch()
                    viewModel.searchBooks(query: viewModel.searchQuery)
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            VStack {
                Spacer(minLength: 12)
                if viewModel.isLoading && viewModel.books.isEmpty {
                    if viewModel.isLoading {
                        ProgressView("Searching Books...")
                    }
                    Spacer()
                } else if viewModel.books.isEmpty {
                    Image(.emptylist)
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 12))
                        .frame(width: 150, height: 150)
                    Text("Please search for books")
                        .font(.title2)
                        .padding()
                    Spacer()
                } else {
                    List(viewModel.books) { book in
                        NavigationLink(destination: BookDetail(book: book)) {
                            BookRow(book: book)
                        }
                        .onAppear {
                            viewModel.loadMoreBooksIfNeeded(
                                currentBook: book)
                        }
                    }
                }
            }
        }
        .navigationTitle("Book Explorer")
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Home()
}
