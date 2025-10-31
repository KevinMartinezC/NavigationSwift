//
//  ScreenBViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine
import Factory

final class CharacterDetailViewModel: ObservableObject {
    private let productService: ProductServiceType
    private let userService: UserServiceType
    
    @Published var characterId: Int
    
    init (
        characterId: Int,
        productService: ProductServiceType,
        userService: UserServiceType
    ) {
        self.characterId = characterId
        self.productService = productService
        self.userService = userService
    }
}

extension CharacterDetailViewModel {
    static func make(characterId: Int) -> CharacterDetailViewModel {
        .init(
            characterId: characterId,
            productService: resolve(\.productService),
            userService: resolve(\.userService)
        )
    }
}
