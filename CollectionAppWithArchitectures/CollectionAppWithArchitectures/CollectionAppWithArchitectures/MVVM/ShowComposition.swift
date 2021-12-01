//
//  ShowComposition.swift
//  CollectionAppWithArchitectures
//
//  Created by Александр Холод on 30.11.2021.
//

import UIKit

final class ShowComposition: UIViewController {
    
    private enum Constant {
        static let stackSpacing = CGFloat(14)
    }
    
    private let costLabel = UILabel()
    private let closeButton = UIButton()
    
    let viewModel = ShowCompositionViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.setupButton()
        self.setupLabel()
        self.setupStackView()
    }
    
    private func setupButton() {
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.closeButton.setTitle("Закрыть", for: .normal)
        self.closeButton.setTitleColor(.systemBlue, for: .normal)
    }
    
    private func setupLabel() {
        self.costLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.viewModel.data.setNotify { [weak self] text in
            self?.costLabel.text = text
        }
    }
    
    private func setupStackView() {
        let stack = UIStackView(arrangedSubviews: [self.costLabel, self.closeButton])
        stack.axis = .vertical
        stack.spacing = Constant.stackSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func buttonTapped() {
        self.dismiss(animated: true)
    }
}

