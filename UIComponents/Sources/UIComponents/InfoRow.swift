//
//  InfoRow.swift
//  UIComponents
//
//  Created by KevinMartinez on 11/10/25.
//

import SwiftUI

public struct InfoRow: View {
    public let icon: String
    public let label: String
    public let value: String

    public init(icon: String, label: String, value: String) {
        self.icon = icon
        self.label = label
        self.value = value
    }

    public var body: some View {
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
        InfoRow(
            icon: "mappin.circle.fill",
            label: "Location",
            value: "Earth (C-137)"
        )
        InfoRow(icon: "tv.fill", label: "Episodes", value: "51")
    }
    .padding()
}
