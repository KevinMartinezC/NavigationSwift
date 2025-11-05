//
//  CharacterInfoSection.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct CharacterInfoSection: View {
    let character: Character

    var body: some View {
        VStack(spacing: 16) {
            // Basic Information
            InfoCard(title: "Basic Information") {
                InfoRow(
                    icon: "person.fill",
                    label: "Species",
                    value: character.species
                )

                if let gender = character.gender, !gender.isEmpty {
                    Divider()
                    InfoRow(
                        icon: "figure.dress.line.vertical.figure",
                        label: "Gender",
                        value: gender
                    )
                }

                if let type = character.type, !type.isEmpty {
                    Divider()
                    InfoRow(
                        icon: "tag.fill",
                        label: "Type",
                        value: type
                    )
                }
            }

            // Location Card
            InfoCard(title: "Location") {
                InfoRow(
                    icon: "mappin.circle.fill",
                    label: "Current",
                    value: character.location.name
                )
                Divider()
                InfoRow(
                    icon: "globe",
                    label: "Origin",
                    value: character.origin.name
                )
            }

            // Episodes Card
            InfoCard(title: "Appearances") {
                HStack {
                    Image(systemName: "tv.fill")
                        .foregroundStyle(.purple)
                        .frame(width: 24)

                    Text("Episodes")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Spacer()

                    Text("\(character.episode.count)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                }
                .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    ScrollView {
        CharacterInfoSection(character: Character.previewList[0])
            .padding()
    }
    .background(Color(.systemGroupedBackground))
}
