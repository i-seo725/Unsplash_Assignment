//
//  StatusCodeError.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation

enum StatusCodeError: Int, Error, LocalizedError {
    case notFound = 404
    case optionalBinding = 900
    
    var errorDescription: String {
        switch self {
        case .notFound:
            return "올바르지 않은 url"
        case.optionalBinding:
            return "에러 상태 코드 옵셔널 바인딩 실패"
        }
        
    }
}
