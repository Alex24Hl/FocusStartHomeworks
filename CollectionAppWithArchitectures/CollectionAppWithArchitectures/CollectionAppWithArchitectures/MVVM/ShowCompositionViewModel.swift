//
//  ShowCompositionViewModel.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 01.12.2021.
//

import Foundation

class Observable<T> {
    var data: T {
        didSet {
            self.notify?(self.data)
        }
    }

    private var notify: ((T) -> Void)?

    init(_ data: T) {
        self.data = data
    }

    func setNotify(notify: @escaping ((T) -> Void)) {
        self.notify = notify
        self.notify?(self.data)
    }
}

class ShowCompositionViewModel {
    private let model = FoodModel.shared

    var data: Observable<String> = Observable<String>("Нет цены")

    init() {
        self.updateModel()
    }

    func updateModel() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { [weak self] in
            let cost = Int.random(in: 300...500)
            self?.data.data = "\(cost) рублей"
        }
    }
}

