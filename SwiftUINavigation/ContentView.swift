//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Edwin Cardenas on 4/25/26.
//

import SwiftUI

struct DetailView: View {
    let number: Int
    // @Binding var path: [Int]
    @Binding var path: NavigationPath

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                ToolbarItem {
                    Button {
                        // path.removeAll()
                        // path = []
                        path = NavigationPath()
                    } label: {
                        Label("Home", systemImage: "house")
                    }
                }
            }
    }
}

struct ContentView: View {
    // @State private var path = [Int]()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
