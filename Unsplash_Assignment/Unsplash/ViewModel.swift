//
//  ViewModel.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation

class ViewModel {
    
    var firstList = Observable(Photo(urls: Urls(raw: "", full: "", regular: "", thumb: ""), likes: 0, views: 0, downloads: 0))
    var secondList = Observable(Photo(urls: Urls(raw: "", full: "", regular: "", thumb: ""), likes: 0, views: 0, downloads: 0))
    var thirdList = Observable(Photo(urls: Urls(raw: "", full: "", regular: "", thumb: ""), likes: 0, views: 0, downloads: 0))
    
    func fetchPhoto() {
        APIManager.shared.getRandomPhoto { data in
            self.firstList.value = data
        }
        APIManager.shared.getRandomPhoto { data in
            self.secondList.value = data
        }
        APIManager.shared.getRandomPhoto { data in
            self.thirdList.value = data
        }
    }
    
}
