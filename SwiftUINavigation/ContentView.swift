//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Edwin Cardenas on 4/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = [32]

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }

                Button("Show 32 then 64") {
                    path = [32, 64]
                }

                Button("Show 5 different views") {
                    path = [1, 2, 3, 4, 5]
                }
            }
            .font(.title)
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
