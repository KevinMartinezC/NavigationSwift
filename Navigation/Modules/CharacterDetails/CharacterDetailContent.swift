//
//  CharacterDetailContent.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI
import UIComponents
import Core


struct CharacterDetailContent: View {
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Character Image
                StatusAvatarView(
                    imageURL: character.image,
                    status: character.status
                )
                
                // Character Name
                Text(character.name)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Status Badge
                StatusBadge(status: character.status)
                
                // Info Section
                CharacterInfoSection(character: character)
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 20)
        }
    }
}

#Preview {
    CharacterDetailContent(character: Character.previewList[0])
        .background(Color(.systemGroupedBackground))
}
