//
//  MoviewListRepoImplementation.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Combine

// MARK: - MOVIES REPOSITRY Implementation
final class MovieListRepoImplementation: MovieListRepoInterface {
    
    let network: MovieNetworkService
    init(network: MovieNetworkService = MovieNetworkService()) {
        self.network = network
    }
    
    func fetchGenres() -> AnyPublisher<AllGenresModel, any Error> {
        return network.fetchGenres()
    }
    
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<AllMovie, any Error> {
        return network.fetchTrendingMovies(page: page, pathURL: pathURL)
    }
    
}
