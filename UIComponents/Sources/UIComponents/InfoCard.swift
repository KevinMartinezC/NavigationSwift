//
//  InfoCard.swift
//  UIComponents
//
//  Created by KevinMartinez on 11/10/25.
//

import SwiftUI

public struct InfoCard<Content: View>: View {
    public let title: String
    public let content: Content

    public init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.secondary)

            VStack(spacing: 12) {
                content
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    VStack(spacing: 16) {
        InfoCard(title: "Basic Information") {
            InfoRow(icon: "person.fill", label: "Species", value: "Human")
            Divider()
            InfoRow(
                icon: "figure.dress.line.vertical.figure",
                label: "Gender",
                value: "Male"
            )
        }

        InfoCard(title: "Location") {
            InfoRow(
                icon: "mappin.circle.fill",
                label: "Current",
                value: "Earth"
            )
            Divider()
            InfoRow(icon: "globe", label: "Origin", value: "Earth (C-137)")
        }
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
