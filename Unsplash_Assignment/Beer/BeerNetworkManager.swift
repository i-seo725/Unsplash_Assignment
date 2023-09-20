//
//  BeerNetworkManager.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation
import Alamofire

class BeerNetworkManager {
    
    static let shared = BeerNetworkManager()
    private init() { }
    
    func request(api: BeerAPI, completionHandler: @escaping (Result<Beer, StatusCodeError>) -> Void) {
        AF.request(api).responseDecodable(of: Beer.self) { response in
            switch response.result {
            case .success(let data):
                print(data)
                completionHandler(.success(data))
            case .failure(let error):
                print(error)
                let statusCode = response.response?.statusCode ?? 900
                guard let error = StatusCodeError(rawValue: statusCode) else { return }
                completionHandler(.failure(error))
            }
        }
    }
    
}
