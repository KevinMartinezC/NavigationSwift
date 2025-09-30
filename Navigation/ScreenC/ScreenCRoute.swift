//
//  ScreenCRoute.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//


import Foundation

struct ScreenCRoute: RouterDestination {
    let id = UUID()
    let message: String
    let onComplete: (String) -> Void
}
