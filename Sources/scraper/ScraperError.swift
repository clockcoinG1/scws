// ScraperError.swift

enum ScraperError: Error {
    case invalidURL
    case invalidResponse
    case invalidHTML
    case networkError(Error)
}