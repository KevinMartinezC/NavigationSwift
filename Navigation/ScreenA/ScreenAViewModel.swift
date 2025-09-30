//
//  ScreenAViewModel.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import Foundation
import Combine

final class ScreenAViewModel: ObservableObject {
    @Publish var message: String
    
    init (
        message: String
    ) {
        self.message = message
    }
    
}

extension ScreenAViewModel {
    static func make(message: String) -> ScreenAViewModel {
        .init(message: message)
    }
}
