//
//  BooksExplorerApp.swift
//  BooksExplorer
//
//  Created by babak on 10/8/24.
//

import SwiftUI

@main
struct BooksExplorerApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
