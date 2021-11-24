//
//  DetailViewController.swift
//  CollectionApp
//
//  Created by Александр Холод on 21.11.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    
    enum Constant {
        static let imageViewTop: CGFloat = 20
        
    }
    private var imageView = UIImageView()
    private let button = UIButton()
    
    var someFood: Food? {
        didSet {
            guard let someFood = someFood else {return}
            
            self.imageView.image = UIImage(named: someFood.image)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(imageView)
        self.view.addSubview(button)
        button.setTitle("Состав", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupImageView()
        setupButton()
    }
    
    @objc private func buttonTapped() {
        present(ShowComposition(), animated: true)
    }
    
    private func setupImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constant.imageViewTop).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor).isActive = true
    }
    
    private func setupButton() {
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat(30)).isActive = true
    }
}


