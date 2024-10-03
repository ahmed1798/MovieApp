//
//  MockMovieDetailsuseCase.swift
//  MovieAppTests
//
//  Created by Ahmed Eissa on 03/10/2024.
//

import Foundation
import Combine
@testable import MovieApp


final class MockMovieDetailsUseCase: MovieDetailsUseCaseProtocol, Mockable {
   
    var shouldReturnError = false
    var errorType: FetchArticlesErrorType = .other(NSError(domain: "", code: -1, userInfo: nil))
    
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, any Error> {
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
            return loadJson(fileName: "MovieDetailsResponse", type: MovieDetailsEntity.self)
        }
    }
}
