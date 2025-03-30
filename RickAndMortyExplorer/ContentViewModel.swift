//
//  ContentViewModel.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var characters: [Character] = []

    func fetchCharacters() {
        if CommandLine.arguments.contains("--uitesting") {
            // Mock data for UI testing
            self.characters = [
                Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: ""),
                Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", gender: "Male", image: "")
            ]
        } else {
            let url = "https://rickandmortyapi.com/api/character"
            APIClient.fetchData(url: url) { (response: APIResponse?) in
                DispatchQueue.main.async {
                    self.characters = response?.results ?? []
                }
            }
        }
    }

}
