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

    // GET method with callback
    func get<T: Decodable>(
        path: String,
        query: [String: String] = [:],
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let request = try buildRequest(
                path: path,
                method: "GET",
                query: query
            )

            session.dataTask(with: request) { data, response, error in
                // Handle error
                if let error = error {
                    completion(.failure(error))
                    return
                }

                // Validate response
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode)
                else {
                    completion(.failure(NetworkError.invalidResponse))
                    return
                }

                // Validate data
                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }

                // Decode
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }

    // POST method with callback
    func post<T: Decodable, Body: Encodable>(
        path: String,
        body: Body,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let request = try buildRequest(
                path: path,
                method: "POST",
                body: body
            )

            session.dataTask(with: request) { data, response, error in
                // Handle error
                if let error = error {
                    completion(.failure(error))
                    return
                }

                // Validate response
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode)
                else {
                    completion(.failure(NetworkError.invalidResponse))
                    return
                }

                // Validate data
                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }

                // Decode
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
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
