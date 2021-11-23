//
//  ShowComposition.swift
//  CollectionApp
//
//  Created by Александр Холод on 22.11.2021.
//

import UIKit

final class ShowComposition: UIViewController {
    
    private let closeButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(closeButton)
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.closeButton.setTitle("Закрыть", for: .normal)
        self.closeButton.setTitleColor(.systemBlue, for: .normal)
        self.closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func buttonTapped() {
        self.dismiss(animated: true)
    }
}
