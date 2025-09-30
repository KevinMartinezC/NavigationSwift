//
//  NavigationCoordinator.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import Foundation
import SwiftUI

@Observable
final class Router {
    var path = NavigationPath()
    var rootCompletion: ((String) -> Void)?
    
    func push(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot(with data: String? = nil) {
        path.removeLast(path.count)
        if let data = data {
            rootCompletion?(data)
        }
    }
}
