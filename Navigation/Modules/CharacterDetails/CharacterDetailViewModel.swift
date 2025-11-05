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
    private let characterService: CharacterServiceType

    @Published var characterId: Int
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var characters: Character? = nil

    init(
        characterId: Int,
        characterService: CharacterServiceType
    ) {
        self.characterId = characterId
        self.characterService = characterService
    }

    func fetchCharacterById(id: Int) {
        isLoading = true
        errorMessage = nil

        characterService.fetchCharacterById(id: id) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false

                switch result {
                case .success(let character):
                    self?.characters = character
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

extension CharacterDetailViewModel {
    static func make(characterId: Int) -> CharacterDetailViewModel {
        .init(
            characterId: characterId,
            characterService: resolve(\.characterService)
        )
    }
}
