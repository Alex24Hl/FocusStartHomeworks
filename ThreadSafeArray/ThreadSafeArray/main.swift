//
//  main.swift
//  ThreadSafeArray
//
//  Created by Александр Холод on 08.11.2021.
//

import Foundation

var array = ThreadSafeArray<Int>()

let newQueue = DispatchQueue(label: "NewQueue", attributes: .concurrent)
let group = DispatchGroup()

func appendElements() {
    group.enter()
    newQueue.async {
        for element in 0...1000 {
            array.append(element)
        }
        group.leave()
    }
    group.enter()
    newQueue.async {
        for element in 0...1000 {
            array.append(element)
        }
        group.leave()
    }
}

appendElements()

group.wait()

sleep(2)
print("Количество элементов в массиве \(array.count)")








