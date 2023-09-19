//
//  BeerCodable.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation

struct BeerElement: Decodable {
    
    var id: Int
    var name: String
    var tagline: String
    var description: String
    var image_url: String
    
}

typealias Beer = [BeerElement]

