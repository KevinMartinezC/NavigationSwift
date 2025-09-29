//
//  ScreenDViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine

final class ScreenDViewModel: ObservableObject {
    
    let message: String
    
    init (
        message: String
    ) {
        self.message = message
    }
    
}

extension ScreenDViewModel {
    static func make(message: String) -> ScreenDViewModel {
        .init(message: message)
    }
}
