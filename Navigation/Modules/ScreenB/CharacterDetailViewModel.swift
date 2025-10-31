//
//  ScreenBViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Combine
import Factory
import Foundation

final class CharacterDetailViewModel: ObservableObject {
    private let rickAndMortyService: RickAndMortyServiceType

    @Published var characterId: Int
    @Published var characters: Character? = nil

    init(
        characterId: Int,
        rickAndMortyService: RickAndMortyServiceType
    ) {
        self.characterId = characterId
        self.rickAndMortyService = rickAndMortyService
    }

    func fetchCharacterById(id: Int) {
        rickAndMortyService.fetchCharacterById(id: id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let character):
                    self?.characters = character
                case .failure:
                    break
                }
            }
        }
    }
}

extension CharacterDetailViewModel {
    static func make(characterId: Int) -> CharacterDetailViewModel {
        .init(
            characterId: characterId,
            rickAndMortyService: resolve(\.rickAndMortyService)
        )
    }
}
