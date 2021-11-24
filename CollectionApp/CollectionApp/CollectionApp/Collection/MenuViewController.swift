//
//  ViewController.swift
//  CollectionApp
//
//  Created by Александр Холод on 19.11.2021.
//

import UIKit

final class MenuViewController: UIViewController {
    
    enum Constant {
        static let mainImageTopAnchor: CGFloat = 10
        static let mainLabelFontSize: CGFloat = 25
        static let mainLabelTopAnchhor: CGFloat = 20
    }
    
    private let collectionView: UICollectionView = {
        let flowLayout = FlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private let foods = Food.foods
    
    private let screenSize = UIScreen.main.bounds
    
    private let mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .systemYellow
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainView
    }()
    
    private let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.image = UIImage(named:"mainImage.png")
        mainImage.clipsToBounds = true
        mainImage.contentMode = .scaleAspectFill
        mainImage.layer.borderColor = UIColor.white.cgColor
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        return mainImage
    }()
    
    private let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Pizza App"
        mainLabel.font = .boldSystemFont(ofSize: Constant.mainLabelTopAnchhor)
        mainLabel.textColor = .black
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.minimumScaleFactor = 0.2
        
        return mainLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Menu"
        
        self.view.addSubview(self.collectionView)
        self.mainView.addSubview(mainImage)
        self.mainView.addSubview(mainLabel)
        self.view.addSubview(mainView)
        
        self.setupCollectionView()
        self.setupMainView()
        self.setupMainImage()
        self.setupMainLabel()
    
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupMainView() {
        self.mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    private func setupMainImage() {
        self.mainImage.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
        self.mainImage.topAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.topAnchor, constant: Constant.mainImageTopAnchor).isActive = true
        self.mainImage.heightAnchor.constraint(equalTo: self.mainView.heightAnchor, multiplier: 0.5).isActive = true
        self.mainImage.widthAnchor.constraint(equalTo: self.mainImage.heightAnchor).isActive = true
    }
    
    private func setupMainLabel() {
        self.mainLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
        self.mainLabel.topAnchor.constraint(lessThanOrEqualTo: self.mainImage.bottomAnchor, constant: 20).isActive = true
        self.mainLabel.topAnchor.constraint(greaterThanOrEqualTo: self.mainImage.bottomAnchor, constant: 5).isActive = true
        self.mainLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.mainView.bottomAnchor, constant: -20).isActive = true
        self.mainLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.mainView.bottomAnchor, constant: -5).isActive = true
    }
    
    private func setupCollectionView() {
        self.collectionView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive =  true
    }
    
    
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.someFood = foods[indexPath.row]
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
