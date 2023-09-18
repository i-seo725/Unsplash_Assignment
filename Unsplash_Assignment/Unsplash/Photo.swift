//
//  Photo.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/18.
//

import Foundation

struct Photo: Codable, Hashable {
    let urls: Urls
    let likes: Int
    let views, downloads: Int
    

    enum CodingKeys: String, CodingKey {
        case urls, likes
        case views, downloads
    }
}


// MARK: - Urls
struct Urls: Codable, Hashable {
    let raw, full, regular, thumb: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, thumb
    }
}
