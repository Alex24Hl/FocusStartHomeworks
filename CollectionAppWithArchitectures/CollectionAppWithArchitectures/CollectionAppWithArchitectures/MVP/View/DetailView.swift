//
//  DetailView.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 30.11.2021.
//

import UIKit

class DetailView: UIView {
    
    enum Constant {
        static let insertsTwenty: CGFloat = 20
        static let insertsThirty: CGFloat = 30
    }
    
    var onTouchedHandler: (() -> Void)?
    
    private var imageView = UIImageView()
    private let button = UIButton()
    
    func configView() {
        self.addSubview(imageView)
        self.addSubview(button)
        
        button.setTitle("Цена", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setupImageView()
        setupButton()
    }
    
    func setImage(name: String) {
        self.imageView.image = UIImage(named: name)
    }
    
    private func setupImageView() {
        self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Constant.insertsTwenty).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor).isActive = true
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupButton() {
        self.button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        self.button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constant.insertsThirty).isActive = true
        self.button.translatesAutoresizingMaskIntoConstraints = false
    }

    @objc private func buttonTapped() {
        self.onTouchedHandler?()
    }
}
