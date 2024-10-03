//
//  MovieDetailsWorker.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 02/10/2024.
//

import Foundation

enum MovieDetailsWorker {
    case getMovieDetailss(apiKey: String, id: Int)
}

extension MovieDetailsWorker: TargetType {
    var base: String {
        switch self {
        default:
            return "https://api.themoviedb.org/3/"
        }
    }
    
    var path: String {
        switch self {
        case .getMovieDetailss(let apiKey, let id):
            return "movie/\(id)?api_key=\(apiKey)"
        }
        
    }
    
    var method: HTTPMethods {
        switch self {
        case .getMovieDetailss:
            return .get
        }
        
    }
    
    var task: NetworkTask {
        switch self {
        case .getMovieDetailss:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMovieDetailss:
            return ["Content-Type": "application/json",
                    "Accept": "application/json"]
        }
    }
}
