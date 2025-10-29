//
//  ServicesContainer.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//

import Foundation
import Factory

extension Container {
    
    var authService: Factory<AuthServiceType> {
        self  {
            AuthService()
        }
        .singleton
    }
    
    var productService: Factory<ProductServiceType> {
        self  {
            ProductService()
        }
        .unique
    }
    
    var userService: Factory<UserServiceType> {
        self  {
            UserService()
        }
        .unique
    }
}
