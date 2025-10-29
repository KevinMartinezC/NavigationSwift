//
//  ScreenAViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Factory
import Combine

final class ScreenAViewModel: ObservableObject {
    private let authService: AuthServiceType
    
    @Published var message: String

    init (
        message: String,
        authService: AuthServiceType
    ) {
        self.message = message
        self.authService = authService
    }
}

extension ScreenAViewModel {
    static func make(message: String = "") -> ScreenAViewModel {
        .init(
            message: message,
            authService: resolve(\.authService)
        )
    }
}
