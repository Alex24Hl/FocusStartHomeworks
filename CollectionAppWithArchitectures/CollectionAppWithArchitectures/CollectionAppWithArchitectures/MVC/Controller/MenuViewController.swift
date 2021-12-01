//
//  ViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 29.11.2021.
//

import UIKit

final class MenuViewController: UIViewController {
    
    private var menuView: MenuView?
    private var menuModel: FoodModel?
    private let foods: [Food]
    
    init() {
        self.menuView = MenuView(frame: .zero)
        self.menuModel = FoodModel.shared
        self.foods = FoodModel.shared.getFood()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.menuView?.loadView(controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuView()
    }
    
    func setupMenuView() {
        self.menuView?.configView()
        self.menuView?.backgroundColor = .systemBackground
        self.menuView?.translatesAutoresizingMaskIntoConstraints = false
        if let menuView = menuView {
            self.view.addSubview(menuView)
        }
        
        self.menuView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.menuView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.menuView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.menuView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foods[indexPath.item]
        let detailViewController = DetailViewController(food: food)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
        cell.someFood = self.foods[indexPath.row]
        return cell
    }
}
