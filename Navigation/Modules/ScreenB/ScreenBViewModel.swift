//
//  ScreenBViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine
import Factory

final class ScreenBViewModel: ObservableObject {
    private let productService: ProductServiceType
    private let userService: UserServiceType
    
    @Published var message: String
    
    init (
        message: String,
        productService: ProductServiceType,
        userService: UserServiceType
    ) {
        self.message = message
        self.productService = productService
        self.userService = userService
    }
}

extension ScreenBViewModel {
    static func make(message: String) -> ScreenBViewModel {
        .init(
            message: message,
            productService: resolve(\.productService),
            userService: resolve(\.userService)
        )
    }
}
