//
//  BeerViewModel.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/20.
//

import Foundation
import Alamofire

class BeerViewModel {
    
    func request(api: BeerAPI, handler: @escaping (URL) -> Void) {
        BeerNetworkManager.shared.request(api: api) { response in
            switch response {
            case .success(let success):
                print("aBeer =============")
                dump(success)
                handler(URL(string: success[0].image_url)!)
                print("aBeer =============")
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
