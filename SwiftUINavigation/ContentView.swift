//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Edwin Cardenas on 4/25/26.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavePath")

    init() {
        if let data = try? Data(contentsOf: savePath),
            let decoded = try? JSONDecoder().decode(
                NavigationPath.CodableRepresentation.self,
                from: data
            )
        {
            path = NavigationPath(decoded)
            return
        }

        path = NavigationPath()
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)

            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data.")
        }
    }
}

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
    @State private var pathStore = PathStore()
    @State private var counter = 0

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: counter, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    ContentView()
}
