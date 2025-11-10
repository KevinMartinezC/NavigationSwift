//
//  MoyaClient.swift
//  Networking
//
//  Created by KevinMartinez on 11/7/25.
//

import Alamofire
import Foundation
import Moya
import Core

public struct MoyaClient: HTTPClient {
    private let baseURL: String
    private let provider: MoyaProvider<MultiTarget>
    private let decoder: JSONDecoder

    public init(
        baseURL: String,
        plugins: [PluginType] = [],
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.baseURL = baseURL
        self.decoder = decoder

        let defaultPlugins: [PluginType] = [
            NetworkLoggerPlugin(
                configuration: .init(
                    logOptions: .verbose
                )
            )
        ]

        self.provider = MoyaProvider<MultiTarget>(
            plugins: plugins.isEmpty ? defaultPlugins : plugins
        )
    }

    public func get<T: Decodable>(
        path: String,
        query: [String: String],
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let task: Task =
            query.isEmpty
            ? .requestPlain
            : .requestParameters(
                parameters: query,
                encoding: URLEncoding.default
            )

        let target = HTTPTarget(
            baseURLString: baseURL,
            path: path,
            method: .get,
            task: task
        )

        executeRequest(target: target, completion: completion)
    }

   public func post<T: Decodable, Body: Encodable>(
        path: String,
        body: Body,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let target = HTTPTarget(
            baseURLString: baseURL,
            path: path,
            method: .post,
            task: .requestJSONEncodable(body)
        )

        executeRequest(target: target, completion: completion)
    }

    private func executeRequest<T: Decodable>(
        target: HTTPTarget,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        provider.request(MultiTarget(target)) { result in
            switch result {
            case .success(let response):
                do {
                    guard (200...299).contains(response.statusCode) else {
                        throw NetworkError.httpError(
                            statusCode: response.statusCode
                        )
                    }

                    let decoded = try self.decoder.decode(
                        T.self,
                        from: response.data
                    )
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

private struct HTTPTarget: TargetType {
    let baseURLString: String
    let path: String
    let method: Moya.Method
    let task: Task

    var baseURL: URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("Invalid base URL: \(baseURLString)")
        }
        return url
    }

    var headers: [String: String]? {
        [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
    }
}
