//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Edwin Cardenas on 4/25/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {

            }
            .toolbar {
                Button("Push Number") {
                    path.append(0320)
                }

                Button("Push String") {
                    path.append("Hello, World!")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
