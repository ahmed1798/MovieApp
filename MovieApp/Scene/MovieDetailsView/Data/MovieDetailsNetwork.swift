//
//  MovieDetailsNetwork.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation
import Combine

protocol MovieDetailsNetworkProtocol {
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, Error>
}

// MARK: - Movie Details Network Service
class MovieDetailsNetworkService: Session<MovieDetailsWorker>, MovieDetailsNetworkProtocol {
    
    private let apiKey = Constants.apiKey
    
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, any Error> {
        return self.fetchRequest(target: .getMovieDetailss(apiKey: apiKey, id: id), MovieDetailsEntity.self)
    }
}
