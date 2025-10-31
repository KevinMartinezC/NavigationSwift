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
        case .characterDetail(let destination):
            CharacterDetailView(
                viewModel: .make(characterId: destination.characterId),
            )
        case .screenC(let destination):
            ScreenCView(
                viewModel: .make(message: destination.message),
                completion: destination.onComplete
            )
        case .screenD(let destination):
            ScreenDView(
                viewModel: .make(message: destination.message),
                completion: destination.onComplete
            )
        case .screenE(let destination):
            ScreenEView(
                viewModel: .make(message: destination.message),
                completion: destination.onComplete
            )
        }
    }
}
