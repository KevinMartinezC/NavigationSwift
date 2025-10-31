//
//  ScreenA.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//

import SwiftUI

struct CharactersView: View {
    @Environment(Router.self) private var router
    @StateObject var viewModel: CharactersViewModel

    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Loading character...")
            } else {
                List(viewModel.characters) { character in
                    CharacterItemView(
                        character: character,
                        action: {
                            router.push(
                                to: .characterDetail(
                                    .init(characterId: character.id)
                                )
                            )
                        }
                    )
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .onAppear {
            viewModel.getCharacters()
        }
        .navigationTitle("Rick and Morty")
    }
}
