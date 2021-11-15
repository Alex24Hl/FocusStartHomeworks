//
//  SkillViewController.swift
//  myCV
//
//  Created by Александр Холод on 13.11.2021.
//

import UIKit

class SkillViewController: UIViewController {
    
    let skillsLabel:UILabel = {
        let skillLabel = UILabel()
        skillLabel.text = "Мои навыки 📚"
        skillLabel.font = UIFont.boldSystemFont(ofSize: 25)
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return skillLabel
    }()
    
    let pyLabel: UILabel = {
        let pyLabel = UILabel()
        pyLabel.text = "Python"
        pyLabel.font = .boldSystemFont(ofSize: 22)
        pyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return pyLabel
    }()
    
    let pySkill: UILabel = {
        let pySkill = UILabel()
        pySkill.text = "\tВ рамках учебы решал различные базовые задачи плюс работал с распознавание объектов с помощью библиотек OpenCV, ImageAI и анализом речии Vosk."
        pySkill.numberOfLines = 0
        pySkill.font = UIFont.systemFont(ofSize: 16)
        pySkill.textAlignment = .justified
        pySkill.translatesAutoresizingMaskIntoConstraints = false
        return pySkill
    }()
        
    
    let swiftLabel: UILabel = {
        let swiftLabel = UILabel()
        swiftLabel.text = "Swift"
        swiftLabel.font = .boldSystemFont(ofSize: 22)
        swiftLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return swiftLabel
    }()
    
    let swiftSkill: UILabel = {
        let swiftSkill = UILabel()
        swiftSkill.text = "\tSwift я изучаю недавно и каждый день я по нему узнаю много нового. Например, сегодня первый раз верстаю кодом)). Параллельно смотрю ролики на Swiftbook и пытаюсь улучшать свои навыки"
        swiftSkill.numberOfLines = 0
        swiftSkill.font = UIFont.systemFont(ofSize: 16)
        swiftSkill.textAlignment = .justified
        swiftSkill.translatesAutoresizingMaskIntoConstraints = false
        
        return swiftSkill
    }()
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.gradientLayer1(firstColor: primaryColor, secondColor: secondaryColor)
    
        view.addSubview(skillsLabel)
        view.addSubview(pyLabel)
        view.addSubview(swiftLabel)
        view.addSubview(pySkill)
        view.addSubview(swiftSkill)
        
        setupSkillsLabel()
        setupPyLabel()
        setupSwiftLabel()
        setupPySkill()
        setupSwiftSkill()
        
    }
    
    func setupSkillsLabel() {
        skillsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skillsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    func setupPyLabel() {
        pyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        pyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        pyLabel.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: 40).isActive = true
        
    }
    
    func setupPySkill() {
        pySkill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        pySkill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        pySkill.topAnchor.constraint(equalTo: pyLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupSwiftLabel() {
        swiftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        swiftLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        swiftLabel.topAnchor.constraint(equalTo: pySkill.bottomAnchor, constant: 30).isActive = true
    }
    
    func setupSwiftSkill() {
        swiftSkill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        swiftSkill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        swiftSkill.topAnchor.constraint(equalTo: swiftLabel.bottomAnchor, constant: 20).isActive = true
    }
    
}
extension UIView {
    func gradientLayer1(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
