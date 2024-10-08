//
//  ContentView.swift
//  BooksExplorer
//
//  Created by babak on 10/8/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State private var showNetworkAlert = false

    var body: some View {
        NavigationStack {
            Home()
        }
        .onChange(of: networkMonitor.isConnected) { connection in
            showNetworkAlert = connection == false
        }
        .alert(
            "Network connection seems to be offline.",
            isPresented: $showNetworkAlert
        ) {}
    }
}

#Preview {
    ContentView()
}
