//
//  Route+Nav.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

extension View {
    @ViewBuilder
    func navGrap(for route: AppRoute) -> some View {
        switch route {
        case let .screenB(destination):
            ScreenBView(
                viewModel: .make(message: destination.message),
                completion:destination.onComplete
            )
        case let .screenC(destination):
            ScreenCView(
                viewModel: .make(message: destination.message),
                completion: destination.onComplete
            )
        case let .screenD(destination):
            ScreenDView(
                viewModel: .make(message: destination.message),
                completion: destination.onComplete
            )
        case let .screenE(destination):
            ScreenEView(
                viewModel: .make(message: destination.message),
                completion: destination.onComplete
            )
        }
    }
}
