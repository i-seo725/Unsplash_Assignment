//
//  BeerViewController.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import UIKit

class BeerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        BeerNetworkManager.shared.request(api: .random) { response in
            switch response {
            case .success(let success):
                print("random =============")
                dump(success)
                print("random =============")
            case .failure(let failure):
                print(failure)
            }
        }
        
        BeerNetworkManager.shared.request(api: .aBeer(id: 91)) { response in
            switch response {
            case .success(let success):
                print("aBeer =============")
                dump(success)
                print("aBeer =============")
            case .failure(let failure):
                print(failure)
            }
        }
        
        BeerNetworkManager.shared.request(api: .beers) { response in
            switch response {
            case .success(let success):
                dump(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
