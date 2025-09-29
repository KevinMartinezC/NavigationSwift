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
    var inputValueFromScreenE: String = ""
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func saveAndReturn(data: String) {
        inputValueFromScreenE = data
        popToRoot()
    }
}
