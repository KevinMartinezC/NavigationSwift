//
//  CharacterImageView.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct CharacterImageView: View {
    let imageURL: String
    let status: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(statusColor, lineWidth: 5)
                    )
                    .shadow(color: statusColor.opacity(0.3), radius: 20, x: 0, y: 10)
                
            case .failure:
                placeholderView
                
            case .empty:
                loadingView
                
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 200, height: 200)
    }
    
    private var placeholderView: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 200, height: 200)
            
            Image(systemName: "person.fill")
                .font(.system(size: 60))
                .foregroundStyle(.secondary)
        }
    }
    
    private var loadingView: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.1))
                .frame(width: 200, height: 200)
            
            ProgressView()
        }
    }
    
    private var statusColor: Color {
        switch status.lowercased() {
        case "alive": .green
        case "dead": .red
        default: .gray
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        CharacterImageView(
            imageURL: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            status: "Alive"
        )
        
        CharacterImageView(
            imageURL: "https://rickandmortyapi.com/api/character/avatar/6.jpeg",
            status: "Dead"
        )
    }
    .padding()
}
