//
//  RickAndMortyService.swift
//  Navigation
//
//  Created by KevinMartinez on 10/30/25.
//

import Foundation

protocol RickAndMortyServiceType {
    func fetchCharacters(
        page: Int,
        completion: @escaping (Result<CharactersResponse, Error>) -> Void
    )
}

struct RickAndMortyService: RickAndMortyServiceType {
    private let client: APIClient

    init(client: APIClient) {
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
}
