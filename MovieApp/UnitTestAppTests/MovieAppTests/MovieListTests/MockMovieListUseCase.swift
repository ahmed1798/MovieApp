//
//  MockMovieListUseCase.swift
//  MovieAppTests
//
//  Created by Ahmed Eissa on 03/10/2024.
//

import Foundation
import Combine
@testable import MovieApp

// MARK: - Enum Error Types
enum FetchArticlesErrorType {
    case invalidAPIKey
    case invalidURL
    case other(Error)
}

final class MockMovieListUseCase: MovieListUseCaseProtocol, Mockable {
    
    var shouldReturnError = false
    var errorType: FetchArticlesErrorType = .other(NSError(domain: "", code: -1, userInfo: nil))
    
    func fetchGenres() -> AnyPublisher<MovieApp.AllGenresModel, any Error> {
        if shouldReturnError {
            switch errorType {
            case .invalidAPIKey:
                let error = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid ApiKey"])
                return Fail(error: error).eraseToAnyPublisher()
            case .invalidURL:
                let error = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                return Fail(error: error).eraseToAnyPublisher()
            case .other(let error):
                return Fail(error: error).eraseToAnyPublisher()
            }
        } else {
            return loadJson(fileName: "GenresResponse", type: AllGenresModel.self)
        }
    }
    
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<MovieApp.AllMovie, any Error> {
        if shouldReturnError {
            switch errorType {
            case .invalidAPIKey:
                let error = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid ApiKey"])
                return Fail(error: error).eraseToAnyPublisher()
            case .invalidURL:
                let error = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
                return Fail(error: error).eraseToAnyPublisher()
            case .other(let error):
                return Fail(error: error).eraseToAnyPublisher()
            }
        } else {
            return loadJson(fileName: "MovieListResponse", type: AllMovie.self)
        }
    }
}
