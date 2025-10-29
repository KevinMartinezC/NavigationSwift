//
//  ScreenCVIewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine
import Factory


final class ScreenCViewModel: ObservableObject {
    private let ProductService: ProductServiceType
    
    @Published var message: String
    
    init (
        message: String,
        productService: ProductServiceType
    ) {
        self.message = message
        self.ProductService = productService
    }
}

extension ScreenCViewModel {
    static func make(message: String) -> ScreenCViewModel {
        .init(
            message: message,
            productService: resolve(\.productService)
        )
    }
}
