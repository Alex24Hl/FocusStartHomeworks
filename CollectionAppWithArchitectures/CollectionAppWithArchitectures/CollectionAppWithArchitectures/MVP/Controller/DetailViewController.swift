//
//  DetailViewController.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 29.11.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    private var customView: DetailView
    private var presenter: Presenter
    
    init(food: Food) {
        self.customView = DetailView(frame: .zero)
        self.presenter = Presenter(food: food)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.presenter.loadView(detailController: self, detailView: self.customView)
    }

//    var someFood: Food? {
//        didSet {
//            guard let someFood = someFood else {return}
//            self.imageView.image = UIImage(named: someFood.image)
//        }
//    }
    
    override func viewDidLoad() {
        self.view.addSubview(customView)
        self.customView.configView()
        self.customView.backgroundColor = .white
        self.customView.translatesAutoresizingMaskIntoConstraints = false
        
        self.customView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.customView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.customView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.customView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        super.viewDidLoad()
    }
}
