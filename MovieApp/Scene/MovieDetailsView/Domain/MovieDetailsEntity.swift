//
//  MovieDetailsEntity.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation

struct MovieDetailsEntity: Codable {
    let budget: Int?
    let genres: [GenreModel]?
    let homepage: String?
    let id: Int?
    let overview: String?
    let backdropPath, posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status, title: String?
    
    enum CodingKeys: String, CodingKey {
        case budget, genres, homepage, id
        case overview
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, title
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}
