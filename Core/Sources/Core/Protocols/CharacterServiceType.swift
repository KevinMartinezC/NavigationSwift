//
//  CharacterServiceType.swift
//  Core
//
//  Created by KevinMartinez on 11/7/25.
//

public protocol CharacterServiceType {
    func fetchCharacters(
        page: Int,
        completion: @escaping (Result<CharactersResponse, Error>) -> Void
    )
    func fetchCharacterById(
        id: Int,
        completion: @escaping (Result<Character, Error>) -> Void
    )
}
