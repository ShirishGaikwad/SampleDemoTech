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
        let url = "https://rickandmortyapi.com/api/character"
        APIClient.fetchData(url: url) { (response: APIResponse?) in
            DispatchQueue.main.async {
                self.characters = response?.results ?? []
            }
        }
    }
}
