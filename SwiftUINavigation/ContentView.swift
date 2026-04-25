//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Edwin Cardenas on 4/25/26.
//

import SwiftUI

struct DetailView: View {
    let number: Int
    @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to next page", value: number + 1)
            .navigationTitle("Page: \(number)")
            .toolbar {
                ToolbarItem {
                    Button {
                        path = NavigationPath()
                    } label: {
                        Label("Home", systemImage: "house")
                    }
                }
            }
    }
}

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var counter = 0

    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: counter, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
