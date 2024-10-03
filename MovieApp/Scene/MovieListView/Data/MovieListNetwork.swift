//
//  MovieListNetwork.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation
import Combine

protocol MovieListNetworkProtocol {
    func fetchGenres() -> AnyPublisher<AllGenresModel, Error>
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<AllMovie, Error>
}

// MARK: - Movie List Network Service
class MovieNetworkService: Session<MovieListWorker>, MovieListNetworkProtocol {
    
    private let apiKey = Constants.apiKey
    
    func fetchGenres() -> AnyPublisher<AllGenresModel, any Error> {
        return self.fetchRequest(target: .getGenres(apiKey: apiKey), AllGenresModel.self)
    }
    
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<AllMovie, any Error> {
        return self.fetchRequest(target: .getTrendingMovies(page: page, apiKey: apiKey, pathURL: pathURL), AllMovie.self)
    }
}
