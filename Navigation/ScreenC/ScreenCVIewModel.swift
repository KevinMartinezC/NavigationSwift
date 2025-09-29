//
//  ScreenCVIewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine

final class ScreenCViewModel: ObservableObject {
    
    let message: String
    
    init (
        message: String
    ) {
        self.message = message
    }
    
}

extension ScreenCViewModel {
    static func make(message: String) -> ScreenCViewModel {
        .init(message: message)
    }
}
