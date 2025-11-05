//
//  InfoRow.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct InfoRow: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.blue)
                .frame(width: 24)
            
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    VStack(spacing: 12) {
        InfoRow(icon: "person.fill", label: "Species", value: "Human")
        InfoRow(icon: "mappin.circle.fill", label: "Location", value: "Earth (C-137)")
        InfoRow(icon: "tv.fill", label: "Episodes", value: "51")
    }
    .padding()
}
