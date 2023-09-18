//
//  APIManager.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/18.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    private init() { }
 
    func getRandomPhoto(completionHandler: @escaping (Photo) -> Void) {
        
        guard let url = URL(string:  "https://api.unsplash.com/photos/random") else {
            print("유효하지 않은 url")
            return
        }
        let header: HTTPHeaders = ["Authorization": "Client-ID \(APIKey.unsplash)"]
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...600).responseDecodable(of: Photo.self) { response in
            guard let statusCode = response.response?.statusCode else { return }
            switch statusCode {
            case 200..<300:
                guard let result = response.value else { return }
                completionHandler(result)
            default:
                guard let error = response.error else { return }
                print(error)
            }
            
        }
        
    }
    
}
