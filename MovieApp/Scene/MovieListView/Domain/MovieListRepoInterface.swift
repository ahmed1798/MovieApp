//
//  MovieListRepoInterface.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation
import Combine

// MARK: - MOVIE LIST REPOSITORY INTERFACE
protocol MovieListRepoInterface {
    func fetchGenres() -> AnyPublisher<AllGenresModel, Error>
    func fetchTrendingMovies(page: Int, pathURL: String) -> AnyPublisher<AllMovie, Error>
}
