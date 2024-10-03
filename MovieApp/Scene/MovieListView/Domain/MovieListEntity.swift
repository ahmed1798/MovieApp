//
//  MoviewListEntity.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation

// MARK: -  Movie List Entity
struct MovieListEntity: Codable {
   
}

// MARK: - All Genres Model
struct AllGenresModel: Codable {
    let genres: [GenreModel]?
}

typealias GenreList = [GenreModel]

// MARK: - Genre Model
struct GenreModel: Codable, Identifiable, Equatable {
    let id: Int?
    let name: String?
}

// MARK: - Movie Model
struct MovieResponseModel: Codable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Movie Model
struct AllMovie: Codable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

typealias MovieList = [MovieModel]

// MARK: - Result
struct MovieModel: Codable, Identifiable {
    let id: Int?
    let backdropPath, posterPath, releaseDate, title: String?

    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}


