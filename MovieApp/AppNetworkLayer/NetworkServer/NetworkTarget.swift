//
//  NetworkTarget.swift
//  MovieApp
//
//  Created by Ahmed Eissa on 29/09/2024.
//

import Foundation

//MARK: - METHOD TYPE
enum HTTPMethods: String {
    case get = "GET"
}

//MARK: - REQUEST TASK TYPE
enum NetworkTask {
    case requestPlain // : REQUEST WITHOUT BODY OR PARAMETERS
}

//MARK: - TARGET TYPE PROTOCOL
protocol TargetType {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethods { get }
    var task: NetworkTask { get }
    var headers: [String: String]? { get }
}
