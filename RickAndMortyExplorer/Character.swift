//
//  Character.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import Foundation

struct APIResponse: Codable {
    let results: [Character]
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
