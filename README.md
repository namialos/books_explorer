
# 📚 Books Explorer

Books Explorer is a SwiftUI-based application that allows users to search for books and explore their details. It features asynchronous API requests with pagination, error handling, and cancellation of previous search requests. The app is optimized for dark mode and offers a smooth user experience with a clean UI.

## Features

- 🔍 **Book Search**: Search for books using a search bar and display results in a list.
- 📖 **Book Details**: View detailed information about a selected book.
- 🌐 **Async API Calls**: Asynchronous API calls using `async/await` with support for canceling ongoing requests.
- 📚 **Pagination**: Lazy loading of books with pagination, loading more as you scroll.
- 🌑 **Dark Mode**: The UI is fully optimized for dark mode.
- 🖼️ **Async Image Loading**: Load book cover images asynchronously using SwiftUI's `AsyncImage`.
- ⚠️ **Error Handling**: Proper error messages are displayed in case of network or data fetching failures.

## Requirements

- iOS 16.6+
- Xcode 16.0+
- Swift 5+

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/books-explorer.git
   cd books-explorer
   ```

2. Open the project in Xcode:

   ```bash
   open BooksExplorer.xcodeproj
   ```

3. Build and run the project on a simulator or a physical device.

## Usage

1. **Search for Books**: Enter book's name in the search bar and press the magnifying glass button.
2. **View Details**: Tap on any book from the search results to view more details about the book.
3. **Pagination**: Scroll down to the bottom of the list to load more books.

## Code Overview

### 1. `FetchService.swift`

The `FetchService` class handles API requests for searching and fetching books. It uses `async/await` to make asynchronous requests and supports pagination. The search task is cancellable, ensuring that ongoing searches can be terminated if a new search is started.

### 2. `Home.swift`

This view contains the search bar and displays the list of books. It also handles user interactions like initiating a search and loading more results when scrolling.

### 3. `BookRow.swift`

A reusable component that displays individual book details (cover image, title, and author) in the list.

### 4. `BookDetail.swift`

Displays detailed information about a selected book, including its cover image, title, author, and first publish year.

## Pagination

Books Explorer supports lazy loading with pagination. As you scroll through the list of books, the app will automatically load more books when the last item appears on the screen.

## Async Image Loading

`AsyncImage` is used to fetch and display book cover images asynchronously. A placeholder is shown while the image is loading.
