//
//  MovieListUseCase.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation
import Combine

protocol MovieListUseCaseProtocol {
    func fetchGenres() -> AnyPublisher<AllGenresModel, Error>
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<AllMovie, Error>
}

// MARK: - MOVIE LIST USE CASES
class MovieListUseCases: MovieListUseCaseProtocol {
    
    let repo: MovieListRepoInterface
    
    init(repo: MovieListRepoInterface = MovieListRepoImplementation()) {
        self.repo = repo
    }
    
    func fetchGenres() -> AnyPublisher<AllGenresModel, any Error> {
        return repo.fetchGenres()
    }
    
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<AllMovie, any Error> {
        return repo.fetchTrendingMovies(page: page, pathURL: pathURL)
    }
}
