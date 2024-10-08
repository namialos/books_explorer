//
//  BookRow.swift
//  BooksExplorer
//
//  Created by babak on 10/9/24.
//

import SwiftUI

struct BookRow: View {
    let book: Book

    var body: some View {
        HStack {

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
                .frame(width: 50, height: 75)
                .cornerRadius(8)
            } else {
                Image(.emptycover)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 75)
                    .clipShape(.rect(cornerRadius: 8))
            }

            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                if book.authorName != nil && !book.authorName!.isEmpty {
                    Text(book.authorName!.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } else {
                    Text("")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
