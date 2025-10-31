//
//  CharacterItem.swift
//  Navigation
//
//  Created by KevinMartinez on 10/31/25.
//

import SwiftUI

struct CharacterItemView: View {
    let character: Character
    let action: () -> Void

    var body: some View {
        HStack(spacing: 16) {
            // Character Image
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    ZStack {
                        Color.gray.opacity(0.2)
                        Image(systemName: "person.fill")
                            .font(.system(size: 30))
                            .foregroundStyle(.secondary)
                    }
                case .empty:
                    ZStack {
                        Color.gray.opacity(0.1)
                        ProgressView()
                    }
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )

            // Character Info
            VStack(alignment: .leading, spacing: 6) {
                Text(character.name)
                    .font(.headline)
                    .lineLimit(2)

                HStack(spacing: 6) {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 10, height: 10)

                    Text(character.status)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(statusColor)
                }

                Text(character.species)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                if let type = character.type, !type.isEmpty {
                    Text(type)
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                        .lineLimit(1)
                }
            }

            Spacer(minLength: 0)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
        .onTapGesture {
            action()
        }
    }

    private var statusColor: Color {
        switch character.status.lowercased() {
        case "alive": .green
        case "dead": .red
        default: .gray
        }
    }
}

#Preview("Card Style") {
    ScrollView {
        VStack(spacing: 12) {
            ForEach(Character.previewList) { character in
                CharacterItemView(
                    character: character,
                    action: {}
                )
            }
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

extension Character {
    static var preview: Character {
        Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            type: nil,
            gender: "Male",
            origin: Location(
                name: "Earth (C-137)",
                url: "https://rickandmortyapi.com/api/location/1"
            ),
            location: Location(
                name: "Citadel of Ricks",
                url: "https://rickandmortyapi.com/api/location/3"
            ),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2",
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
    }

    static var previewList: [Character] {
        [
            Character(
                id: 1,
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: nil,
                gender: "Male",
                origin: Location(name: "Earth (C-137)", url: ""),
                location: Location(name: "Citadel of Ricks", url: ""),
                image:
                    "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                episode: [],
                url: "",
                created: ""
            ),
            Character(
                id: 2,
                name: "Morty Smith",
                status: "Alive",
                species: "Human",
                type: nil,
                gender: "Male",
                origin: Location(name: "Earth (C-137)", url: ""),
                location: Location(
                    name: "Earth (Replacement Dimension)",
                    url: ""
                ),
                image:
                    "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                episode: [],
                url: "",
                created: ""
            ),
            Character(
                id: 3,
                name: "Summer Smith",
                status: "Alive",
                species: "Human",
                type: nil,
                gender: "Female",
                origin: Location(
                    name: "Earth (Replacement Dimension)",
                    url: ""
                ),
                location: Location(
                    name: "Earth (Replacement Dimension)",
                    url: ""
                ),
                image:
                    "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
                episode: [],
                url: "",
                created: ""
            ),
            Character(
                id: 7,
                name: "Abradolf Lincler",
                status: "unknown",
                species: "Human",
                type: "Genetic experiment",
                gender: "Male",
                origin: Location(
                    name: "Earth (Replacement Dimension)",
                    url: ""
                ),
                location: Location(name: "Testicle Monster Dimension", url: ""),
                image:
                    "https://rickandmortyapi.com/api/character/avatar/7.jpeg",
                episode: [],
                url: "",
                created: ""
            ),
            Character(
                id: 6,
                name: "Abadango Cluster Princess",
                status: "Dead",
                species: "Alien",
                type: nil,
                gender: "Female",
                origin: Location(name: "Abadango", url: ""),
                location: Location(name: "Abadango", url: ""),
                image:
                    "https://rickandmortyapi.com/api/character/avatar/6.jpeg",
                episode: [],
                url: "",
                created: ""
            ),
        ]
    }
}
