//
//  CharactersTableViewController.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 30/03/25.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    private var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterCell")
        fetchCharacters()
    }

    private func fetchCharacters() {
        if CommandLine.arguments.contains("--uitesting") {
            characters = [
                Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: ""),
                Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", gender: "Male", image: "")
            ]
            tableView.reloadData()
        } else {
            let url = "https://rickandmortyapi.com/api/character"
            APIClient.fetchData(url: url) { (response: APIResponse?) in
                DispatchQueue.main.async {
                    self.characters = response?.results ?? []
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        cell.imageView?.image = UIImage(systemName: "person.crop.circle") // Placeholder image
        cell.accessibilityIdentifier = "characterCell_\(character.id)" // Set accessibility identifier
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.character = character
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
