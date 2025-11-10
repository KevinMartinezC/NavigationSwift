//
//  Character.swift
//  Core
//
//  Created by KevinMartinez on 11/7/25.
//

public struct Character: Codable, Identifiable {
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String?
    public let gender: String?
    public let origin: Location
    public let location: Location
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
}

public struct Location: Codable {
    public let name: String
    public let url: String

    public init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

public extension Character {
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
