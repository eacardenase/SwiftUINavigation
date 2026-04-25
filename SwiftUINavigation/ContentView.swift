//
//  ContentView.swift
//  SwiftUINavigation
//
//  Created by Edwin Cardenas on 4/25/26.
//

import SwiftUI

struct DetailView: View {
    let number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number

        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                DetailView(number: selection)
            }
        }
    }
}

#Preview {
    ContentView()
}
