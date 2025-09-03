//
//  LocalJsonLoader.swift
//  Sample
//
//  Created by Moni on 02/09/25.
//
import Foundation

class LocalJsonLoader {
    func loadJson<T: Decodable>(_ fileName: String, as _: T.Type = T.self) -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error loading JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
