//
//  ContentView.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                NavigationLink(destination: DetailView(character: character)) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)

                        Text(character.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    ContentView()
}
