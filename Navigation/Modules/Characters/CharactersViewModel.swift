//
//  ScreenAViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Combine
import Factory
import Foundation

final class CharactersViewModel: ObservableObject {
    private let characterService: CharacterServiceType
    
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    init(
        characterService: CharacterServiceType
    ) {
        self.characterService = characterService
    }

    func getCharacters() {
        isLoading = true

        characterService.fetchCharacters(page: 1) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false

                switch result {
                case .success(let response):
                    self?.characters = response.results
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

extension CharactersViewModel {
    static func make() -> CharactersViewModel {
        .init(
            characterService: resolve(\.characterService),
        )
    }
}
