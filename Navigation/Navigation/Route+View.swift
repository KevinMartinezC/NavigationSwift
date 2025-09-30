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
                viewModel: .init(message: destination.message),
                completion:destination.onComplete
            )
        case let .screenC(destination):
            ScreenCView(
                viewModel: .init(message: destination.message),
                completion: destination.onComplete
            )
        case let .screenD(destination):
            ScreenDView(
                viewModel: .init(message: destination.message),
                completion: destination.onComplete
            )
        case let .screenE(destination):
            ScreenEView(
                viewModel: .init(message: destination.message),
                completion: destination.onComplete
            )
        }
    }
}
