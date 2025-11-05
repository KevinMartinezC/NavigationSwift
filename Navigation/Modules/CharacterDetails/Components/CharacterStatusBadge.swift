//
//  CharacterStatusBadge.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct CharacterStatusBadge: View {
    let status: String

    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(statusColor)
                .frame(width: 12, height: 12)

            Text(status)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(statusColor.opacity(0.15))
        .foregroundStyle(statusColor)
        .clipShape(Capsule())
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
    VStack(spacing: 16) {
        CharacterStatusBadge(status: "Alive")
        CharacterStatusBadge(status: "Dead")
        CharacterStatusBadge(status: "unknown")
    }
    .padding()
}
