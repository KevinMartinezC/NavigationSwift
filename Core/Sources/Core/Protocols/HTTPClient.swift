//
//  HTTPClient.swift
//  Core
//
//  Created by KevinMartinez on 11/7/25.
//

public protocol HTTPClient {
    func get<T: Decodable>(
        path: String,
        query: [String: String],
        completion: @escaping (Result<T, Error>) -> Void
    )

    func post<T: Decodable, Body: Encodable>(
        path: String,
        body: Body,
        completion: @escaping (Result<T, Error>) -> Void
    )
}
