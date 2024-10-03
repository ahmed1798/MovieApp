//
//  MovieDetailsRepoImplementation.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation
import Combine

// MARK: - MOVIE REPOSITRY Implementation
final class MovieDetailsRepoImplementation: MovieDetailsRepoInterface {
    
    let network: MovieDetailsNetworkService
    init(network: MovieDetailsNetworkService = MovieDetailsNetworkService()) {
        self.network = network
    }
    
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, any Error> {
        return network.fetchMovieDetails(id: id)
    }
}
