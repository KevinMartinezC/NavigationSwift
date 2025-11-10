//
//  CharactersResponse.swift
//  Core
//
//  Created by KevinMartinez on 11/7/25.
//

public struct CharactersResponse: Codable {
   public let info: PageInfo
   public let results: [Character]
}

public struct PageInfo: Codable {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?
}
