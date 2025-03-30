//
//  ContentView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI

import SwiftUI

struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let navController = UINavigationController(rootViewController: CharactersTableViewController())
        return navController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}

#Preview {
    ContentView()
}
