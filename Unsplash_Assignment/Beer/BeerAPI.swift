//
//  BeerAPI.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerAPI {
    
    var baseURL: String {
        return "https://api.punkapi.com/v2/"
    }
    
    case beers
    case aBeer(id: Int)
    case random
    
    var endpoint: URL? {
        switch self {
        case .beers:
            return URL(string: baseURL + "beers")
        case .aBeer(let id):
            return URL(string: baseURL + "beers/\(id)")
        case .random:
            return URL(string: baseURL + "beers/random")
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
