//
//  Observable.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/19.
//

import Foundation

class Observable<T> {
    
    private var listener: ((T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ handler: @escaping (T) -> Void) {
        listener = handler
        handler(value)
    }
    
}
