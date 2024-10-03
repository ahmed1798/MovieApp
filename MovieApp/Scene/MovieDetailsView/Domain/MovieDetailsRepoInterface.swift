//
//  MovieDetailsRepoInterface.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation
import Combine

// MARK: - MOVIE DETAILS REPOSITORY INTERFACE
protocol MovieDetailsRepoInterface {
    func fetchMovieDetails(id: Int) -> AnyPublisher<MovieDetailsEntity, Error>
}
