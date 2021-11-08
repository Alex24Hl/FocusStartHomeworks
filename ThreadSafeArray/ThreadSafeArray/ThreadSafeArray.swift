//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Александр Холод on 08.11.2021.
//

import Foundation

class ThreadSafeArray<T> {
    
    private var saveArray = [T]()
    private let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    var count: Int {
        return saveArray.count
    }
    
    var isEmpty: Bool {
        saveArray.isEmpty
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) {
            self.saveArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.queue.async(flags: .barrier) {
            if index < self.saveArray.count {
                self.saveArray.remove(at: index)
            }
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func containts(_ element: T) -> Bool {
        queue.sync {
            self.saveArray.contains(element)
        }
    }
}
    
