//
//  Generator.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/18/22.
//

import Foundation
import UIKit

protocol AsyncGeneratorType {
    associatedtype Element
    associatedtype Fetch
    mutating func next(fetchNextBatch: Fetch, onFinish: ((Element) -> Void)?)
}

class PagingGenerator<T>: AsyncGeneratorType {
    typealias Element = Array<T>
    typealias Fetch = (_ offset: Int, _ limit: Int, _ completion: (_ result: Element) -> Void) -> Void
    
    var offset:Int
    let limit: Int
    
    init(startOffset: Int = 0, limit: Int = 25) {
        self.offset = startOffset
        self.limit = limit
    }
    
    func next(fetchNextBatch: Fetch, onFinish: ((Element) -> Void)? = nil) {
        fetchNextBatch(offset, limit) { [unowned self] (items) in
            onFinish?(items)
            self.offset += items.count
        }
    }
}

