//
//  ScreenB.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            content
        }
        .navigationTitle("Character Detail")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchCharacterById(id: viewModel.characterId)
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            LoadingView()
        } else if let error = viewModel.errorMessage {
            ErrorView(error: error) {
                viewModel.fetchCharacterById(id: viewModel.characterId)
            }
        } else if let character = viewModel.characters {
            CharacterDetailContent(character: character)
        } else {
            EmptyStateView()
        }
    }
}

#Preview {
    NavigationStack {
        CharacterDetailView(viewModel: .make(characterId: 1))
    }
}
