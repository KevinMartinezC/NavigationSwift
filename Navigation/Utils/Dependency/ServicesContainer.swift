//
//  ServicesContainer.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//

import Factory
import Foundation

extension Container {

    var httpClient: Factory<HTTPClient> {
          self {
              APIClient(baseURL: "https://rickandmortyapi.com/api")
          }
          .singleton
      }

    var characterService: Factory<CharacterServiceType> {
        self {
            CharacterService(client: self.httpClient())
        }
        .unique
    }

    var authService: Factory<AuthServiceType> {
        self {
            AuthService()
        }
        .singleton
    }

    var productService: Factory<ProductServiceType> {
        self {
            ProductService()
        }
        .unique
    }

    var userService: Factory<UserServiceType> {
        self {
            UserService()
        }
        .unique
    }
}
