//
//  ScreenBViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine

final class ScreenBViewModel: ObservableObject {
    
    @Published var message: String
    
    init (
        message: String
    ) {
        self.message = message
    }
    
}

extension ScreenBViewModel {
    static func make(message: String) -> ScreenBViewModel {
        .init(message: message)
    }
}
