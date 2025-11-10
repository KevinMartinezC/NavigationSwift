//
//  CharacterService.swift
//  Core
//
//  Created by KevinMartinez on 11/7/25.
//

public struct CharacterService: CharacterServiceType {
    private let client: HTTPClient

    public init(client: HTTPClient) {
        self.client = client
    }

    public func fetchCharacters(
        page: Int = 1,
        completion: @escaping (Result<CharactersResponse, Error>) -> Void
    ) {
        client.get(
            path: "/character",
            query: ["page": "\(page)"],
            completion: completion
        )
    }

    public func fetchCharacterById(
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
