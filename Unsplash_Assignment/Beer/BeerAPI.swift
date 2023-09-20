//
//  BeerAPI.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerAPI: URLRequestConvertible {
    
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/")!
    }
    
    case beers
    case aBeer(id: Int)
    case random
    
    private var endpoint: String {
        switch self {
        case .beers:
            return "beers"
        case .aBeer(let id):
            return "beers/\(id)"
        case .random:
            return "beers/random"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
    
}
