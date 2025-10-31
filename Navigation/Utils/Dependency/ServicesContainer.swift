//
//  ServicesContainer.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//

import Factory
import Foundation

extension Container {

    var apiClient: Factory<APIClient> {
        self {
            APIClient(baseURL: "https://rickandmortyapi.com/api")
        }.singleton
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
