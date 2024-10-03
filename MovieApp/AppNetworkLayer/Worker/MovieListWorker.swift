//
//  MoviewListWorker.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation

enum MovieListWorker {
    case getGenres(apiKey: String)
    case getTrendingMovies(page: Int, apiKey: String, pathURL: String)
}

extension MovieListWorker: TargetType {
    var base: String {
        switch self {
        default:
            return "https://api.themoviedb.org/3/"
        }
    }
    
    var path: String {
        switch self {
        case .getGenres(let apiKey):
            return "genre/movie/list?api_key=\(apiKey)"
        case .getTrendingMovies(let page, let apiKey, let pathURL):
            return "discover/movie?include_adult=false&sort_by=popularity.desc&page=\(page)&api_key=\(apiKey)\(pathURL)"
        }
        
    }
    
    var method: HTTPMethods {
        switch self {
        case .getGenres, .getTrendingMovies:
            return .get
        }
        
    }
    
    var task: NetworkTask {
        switch self {
        case .getGenres, .getTrendingMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getGenres, .getTrendingMovies:
            return ["Content-Type": "application/json",
                    "Accept": "application/json"]
        }
    }
}


