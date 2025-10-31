import Foundation

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