//
//  BeerViewController.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import UIKit
import SnapKit
import Kingfisher

class BeerViewController: UIViewController {
    
    let imageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    let viewModel = BeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(250)
        }
       
        viewModel.request(api: .aBeer(id: 7)) { url in
            self.imageView.kf.setImage(with: url)
        }
    }
    
}
