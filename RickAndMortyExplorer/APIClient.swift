//
//  APIClient.swift
//  RickAndMortyExplorer
//
//  Created by shirish gayakawad on 29/03/25.
//

import Foundation

public class APIClient {
    public static func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }

            let decodedData = try? JSONDecoder().decode(T.self, from: data)
            completion(decodedData)
        }.resume()
    }
}
