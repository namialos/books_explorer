//
//  BookDetail.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import SwiftUI

struct BookDetail: View {
    let book: Book

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if book.coverId != nil,
                let url = URL(
                    string: Constants.coverUrl + "\(book.coverId!).jpg")
            {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(.placeholderimage)
                        .resizable()
                        .scaledToFit()
                }
                .cornerRadius(8)
            } else {
                Image(.emptycover)
                    .resizable()
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 8))
            }
            Text(book.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            if book.authorName != nil {
                Text("Author: \(book.authorName!.joined(separator: ", "))")
                    .font(.title2)
                    .foregroundColor(.gray)
            }
            if book.firstPublishYear != nil {
                Text("First publish year: \(String(book.firstPublishYear!))")
                    .font(.body)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(book.title)
        .foregroundColor(.white)
    }
}
