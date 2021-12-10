//
//  MenuCell.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 29.11.2021.
//

import UIKit

protocol IMenuCell {
    func update(name: String)
}

final class MenuCell: UICollectionViewCell {
    
    static let identifier = "MenuCell"
    
    private let imageView = UIImageView()
    
    var someFood: Food? {
        didSet{
            guard let someFood = someFood else { return }
            self.imageView.image = UIImage(named: someFood.image)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        self.setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

extension MenuCell: IMenuCell {
    func update(name: String) {
        self.imageView.image = UIImage(named: someFood?.image ?? "")
    }
}
