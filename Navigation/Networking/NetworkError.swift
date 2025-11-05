//
//  NetworkError.swift
//  Navigation
//
//  Created by KevinMartinez on 10/30/25.
//

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case invalidURL
    case invalidResponse
    case noData
    case httpError(statusCode: Int)
    case decodingError(String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .noData:
            return "No data received"
        case .httpError(let statusCode):
            return "HTTP Error \(statusCode): \(httpStatusMessage(statusCode))"
        case .decodingError(let message):
            return "Decoding error: \(message)"
        }
    }

    private func httpStatusMessage(_ statusCode: Int) -> String {
        switch statusCode {
        case 400: return "Bad Request"
        case 401: return "Unauthorized"
        case 403: return "Forbidden"
        case 404: return "Not Found"
        case 500: return "Internal Server Error"
        case 502: return "Bad Gateway"
        case 503: return "Service Unavailable"
        default: return "Unknown Error"
        }
    }
}
