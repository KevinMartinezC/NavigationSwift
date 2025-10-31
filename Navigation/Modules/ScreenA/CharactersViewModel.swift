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
    private let rickyAndMortyService: RickAndMortyServiceType

    @Published var message: String
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    init(
        message: String,
        rickyAndMortyService: RickAndMortyServiceType
    ) {
        self.message = message
        self.rickyAndMortyService = rickyAndMortyService
    }

    func getCharacters() {
        isLoading = true

        rickyAndMortyService.fetchCharacters(page: 1) { [weak self] result in
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
    static func make(message: String = "") -> CharactersViewModel {
        .init(
            message: message,
            rickyAndMortyService: resolve(\.rickAndMortyService),
        )
    }
}
