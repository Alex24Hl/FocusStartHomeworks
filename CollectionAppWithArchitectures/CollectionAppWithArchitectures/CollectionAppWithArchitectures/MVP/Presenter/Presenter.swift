//
//  Presenter.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 30.11.2021.
//

import Foundation

final class Presenter {
    
    private weak var detailView: DetailView?
    private weak var detailController: DetailViewController?
    
    private let model = FoodModel.shared
    private let food: Food
    
    init(food: Food) {
        self.food = food
    }
    
    func loadView(detailController: DetailViewController, detailView: DetailView) {
        self.detailController = detailController
        self.detailView = detailView
        self.detailView?.configView()
        
        self.detailView?.setImage(name: food.image)
        setHandlers()
    }
    
    private func buttonTapped() {
        self.detailController?.present(ShowComposition(), animated: true)
    }
    
    private func setHandlers() {
        self.detailView?.onTouchedHandler = { [weak self] in
            self?.buttonTapped()
        }
    }
}
