//
//  ScreenEViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//


import Foundation
import Combine

final class ScreenEViewModel: ObservableObject {
    
    let message: String
    
    init (
        message: String
    ) {
        self.message = message
    }
    
}

extension ScreenEViewModel {
    static func make(message: String) -> ScreenEViewModel {
        .init(message: message)
    }
}
