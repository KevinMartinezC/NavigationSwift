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
    
    func push(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
