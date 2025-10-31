//
//  ScreenB.swift
//  Navigation
//
//  Created by KevinMartinez on 9/29/25.
//
import SwiftUI

struct CharacterDetailView: View {
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        VStack(spacing: 20) {
          
        }
        .padding()
        .onAppear {
            viewModel.fetchCharacterById(id: viewModel.characterId)
        }
    }
}
