//
//  APIClient.swift
//  Navigation
//
//  Created by KevinMartinez on 10/30/25.
//

import Foundation

final class APIClient {
    private let baseURL: String
    private let session: URLSession

    init(baseURL: String, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }

    //Get method
    func get<T: Decodable>(_ path: String, query: [String: String] = [:])
        async throws -> T
    {
        let request = try buildRequest(path: path, method: "GET", query: query)
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    //Post method
    func post<T: Decodable, Body: Encodable>(_ path: String, body: Body)
        async throws -> T
    {
        let request = try buildRequest(path: path, method: "POST", body: body)
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    private func buildRequest(
        path: String,
        method: String,
        query: [String: String] = [:],
        body: (any Encodable)? = nil
    ) throws -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }

        if !query.isEmpty {
            components.queryItems = query.map {
                URLQueryItem(name: $0, value: $1)
            }
        }

        guard let url = components.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        if let body {
            request.httpBody = try JSONEncoder().encode(body)
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
        }

        return request
    }
}

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case noData

    var errorDescription: String? {
        switch self {
        case .invalidURL: "Invalid URL"
        case .invalidResponse: "Invalid response from server"
        case .noData: "No data received"
        }
    }
}
