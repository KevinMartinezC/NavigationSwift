//
//  RickAndMortyService.swift
//  Navigation
//
//  Created by KevinMartinez on 10/30/25.
//

import Foundation

protocol CharacterServiceType {
    func fetchCharacters(
        page: Int,
        completion: @escaping (Result<CharactersResponse, Error>) -> Void
    )
    func fetchCharacterById(
        id: Int,
        completion: @escaping (Result<Character, Error>) -> Void
    )
}

struct CharacterService: CharacterServiceType {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func fetchCharacters(
        page: Int = 1,
        completion: @escaping (Result<CharactersResponse, Error>) -> Void
    ) {
        client.get(
            path: "/character",
            query: ["page": "\(page)"],
            completion: completion
        )
    }

    func fetchCharacterById(
        id: Int,
        completion: @escaping (Result<Character, Error>) -> Void
    ) {
        client.get(
            path: "/character/\(id)",
            query: [:],
            completion: completion
        )
    }
}
