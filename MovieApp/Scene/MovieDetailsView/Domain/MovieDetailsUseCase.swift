//
//  MovieDetailsUseCase.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation
import Combine

protocol MovieDetailsUseCaseProtocol {
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, Error>
}

// MARK: - MOVIE LIST USE CASES
class MovieDetailsUseCases: MovieDetailsUseCaseProtocol {
    
    let repo: MovieDetailsRepoInterface
    
    init(repo: MovieDetailsRepoInterface = MovieDetailsRepoImplementation()) {
        self.repo = repo
    }
    
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, any Error> {
        return repo.fetchMovieDetails(id: id)
    }
}
