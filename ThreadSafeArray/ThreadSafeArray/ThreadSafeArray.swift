//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by Александр Холод on 08.11.2021.
//

import Foundation

class ThreadSafeArray<T> {
    
    private var array = [T]()
    private let queue = DispatchQueue(label: "ConcurrentQueue", attributes: .concurrent)
    
    var count: Int {
        self.queue.sync {
            array.count
        }
    }
    
    var isEmpty: Bool {
        self.queue.sync {
            array.isEmpty
        }
    }
    
    func append(_ item: T) {
        self.queue.async(flags: .barrier) {
            self.array.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.queue.async(flags: .barrier) {
            if index < self.array.count {
                self.array.remove(at: index)
            }
        }
    }
    
    subscript(index: Int) -> T {
        get {
            return self.queue.sync {
                self.array[index]
            }
        }
    }
}

extension ThreadSafeArray where T: Equatable {
    func containts(_ element: T) -> Bool {
        queue.sync {
            self.array.contains(element)
        }
    }
}
    
