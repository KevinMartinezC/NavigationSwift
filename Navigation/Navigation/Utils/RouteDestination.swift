//
//  RouterDestination.swift
//  Navigation
//
//  Created by KevinMartinez on 9/30/25.
//

import Foundation

protocol RouteDestination: Equatable, Hashable {
    var id: UUID { get }
}

extension RouteDestination {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
