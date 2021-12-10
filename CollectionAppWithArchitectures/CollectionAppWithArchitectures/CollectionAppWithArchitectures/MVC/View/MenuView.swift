//
//  MenuView.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 29.11.2021.
//

import UIKit

final class MenuView: UIView {

    enum Constant {
        static let insertsFive: CGFloat = 5
        static let insertsTwenty: CGFloat = 20
        static let insertsTwentyFive: CGFloat = 25
    }
    
    private weak var controller: MenuViewController?
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = FlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: MenuCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.backgroundColor = .systemYellow
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private lazy var mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.image = UIImage(named:"mainImage.png")
        mainImage.clipsToBounds = true
        mainImage.contentMode = .scaleAspectFill
        mainImage.layer.borderColor = UIColor.white.cgColor
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        return mainImage
    }()
    
    private lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = "Pizza app"
        mainLabel.font = .boldSystemFont(ofSize: Constant.insertsTwentyFive)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.minimumScaleFactor = 0.2
        return mainLabel
    }()
    
    func configView() {
        self.addSubview(self.collectionView)
        self.addSubview(self.mainView)
        self.addSubview(self.mainImage)
        self.addSubview(self.mainLabel)
        
        self.setupMainView()
        self.setupMainImage()
        self.setupMainLabel()
        self.setupCollectionView()
        
        self.collectionView.delegate = self.controller
        self.collectionView.dataSource = self.controller
    }
    
    func loadView(controller: MenuViewController) {
        self.controller = controller
    }
    
    private func setupMainView() {
        self.mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.mainView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4).isActive = true
    }
    
    private func setupMainImage() {
        self.mainImage.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
        self.mainImage.topAnchor.constraint(equalTo: self.mainView.safeAreaLayoutGuide.topAnchor, constant: Constant.insertsTwenty).isActive = true
        self.mainImage.heightAnchor.constraint(equalTo: self.mainView.heightAnchor, multiplier: 0.5).isActive = true
        self.mainImage.widthAnchor.constraint(equalTo: self.mainImage.heightAnchor).isActive = true
    }
    
    private func setupMainLabel() {
        self.mainLabel.centerXAnchor.constraint(equalTo: self.mainView.centerXAnchor).isActive = true
        self.mainLabel.topAnchor.constraint(lessThanOrEqualTo: self.mainImage.bottomAnchor, constant: Constant.insertsTwenty).isActive = true
        self.mainLabel.topAnchor.constraint(greaterThanOrEqualTo: self.mainImage.bottomAnchor, constant: Constant.insertsFive).isActive = true
        self.mainLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.mainView.bottomAnchor, constant: -Constant.insertsTwenty).isActive = true
        self.mainLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.mainView.bottomAnchor, constant: -Constant.insertsFive).isActive = true
    }
    
    private func setupCollectionView() {
        self.collectionView.topAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive =  true
    }
}
