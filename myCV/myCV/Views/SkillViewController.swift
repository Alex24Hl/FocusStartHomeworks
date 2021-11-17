//
//  SkillViewController.swift
//  myCV
//
//  Created by Александр Холод on 13.11.2021.
//

import UIKit

final class SkillViewController: UIViewController {
    
    private enum ConstantSkill {
        static let skillLabelSize: CGFloat = 25
        static let skillLabelTopAnchor: CGFloat = 20
        
        static let pyLabelSize: CGFloat = 22
        static let pyLabelLeadingAcnhor: CGFloat = 40
        static let pyLabelTrailingAnchor: CGFloat = -40
        static let pyLAbelTopAnchor: CGFloat = 40
        
        static let pySkillSize: CGFloat = 16
        static let pySkillLeadingAnchor: CGFloat = 40
        static let pySkillTrailingAnchor: CGFloat = -40
        static let pySkillTopAnchor: CGFloat = 20
        
        static let swiftLabelSize: CGFloat = 22
        static let swiftLabelLeadingAnchor: CGFloat = 40
        static let swiftLabelTrailingAnchor: CGFloat = -40
        static let swiftLabelTopAnchor: CGFloat = 30
        
        static let swiftSkillSize: CGFloat = 16
        static let swiftSkillLeadingAnchor: CGFloat = 40
        static let swiftSkillTrailingAnchor: CGFloat = -40
        static let swiftSkillTopAnchor: CGFloat = 20
    }
    
    private let skillsLabel:UILabel = {
        let skillLabel = UILabel()
        skillLabel.text = "Мои навыки 📚"
        skillLabel.font = UIFont.boldSystemFont(ofSize: ConstantSkill.skillLabelSize)
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return skillLabel
    }()
    
    private let pyLabel: UILabel = {
        let pyLabel = UILabel()
        pyLabel.text = "Python"
        pyLabel.font = .boldSystemFont(ofSize: ConstantSkill.pyLabelSize)
        pyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return pyLabel
    }()
    
    private let pySkill: UILabel = {
        let pySkill = UILabel()
        pySkill.text = "\tВ рамках учебы решал различные базовые задачи плюс работал с распознавание объектов с помощью библиотек OpenCV, ImageAI и анализом речии Vosk."
        pySkill.numberOfLines = 0
        pySkill.font = UIFont.systemFont(ofSize: ConstantSkill.pySkillSize)
        pySkill.textAlignment = .justified
        pySkill.translatesAutoresizingMaskIntoConstraints = false
        return pySkill
    }()
        
    
    private let swiftLabel: UILabel = {
        let swiftLabel = UILabel()
        swiftLabel.text = "Swift"
        swiftLabel.font = .boldSystemFont(ofSize: ConstantSkill.swiftLabelSize)
        swiftLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return swiftLabel
    }()
    
    private let swiftSkill: UILabel = {
        let swiftSkill = UILabel()
        swiftSkill.text = "\tSwift я изучаю недавно и каждый день я по нему узнаю много нового. Например, сегодня первый раз верстаю кодом)). Параллельно смотрю ролики на Swiftbook и пытаюсь улучшать свои навыки"
        swiftSkill.numberOfLines = 0
        swiftSkill.font = UIFont.systemFont(ofSize: ConstantSkill.swiftSkillSize)
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
    
    private func setupSkillsLabel() {
        skillsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skillsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantSkill.skillLabelTopAnchor).isActive = true
    }
    
    private func setupPyLabel() {
        pyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantSkill.pyLabelLeadingAcnhor).isActive = true
        pyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantSkill.pyLabelTrailingAnchor).isActive = true
        pyLabel.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: ConstantSkill.pyLAbelTopAnchor).isActive = true
        
    }
    
    private func setupPySkill() {
        pySkill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantSkill.pySkillLeadingAnchor).isActive = true
        pySkill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantSkill.pySkillTrailingAnchor).isActive = true
        pySkill.topAnchor.constraint(equalTo: pyLabel.bottomAnchor, constant: ConstantSkill.pySkillTopAnchor).isActive = true
    }
    
    private func setupSwiftLabel() {
        swiftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantSkill.swiftLabelLeadingAnchor).isActive = true
        swiftLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantSkill.swiftLabelTrailingAnchor).isActive = true
        swiftLabel.topAnchor.constraint(equalTo: pySkill.bottomAnchor, constant: ConstantSkill.swiftLabelTopAnchor).isActive = true
    }
    
    private func setupSwiftSkill() {
        swiftSkill.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantSkill.swiftSkillLeadingAnchor).isActive = true
        swiftSkill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantSkill.swiftSkillTrailingAnchor).isActive = true
        swiftSkill.topAnchor.constraint(equalTo: swiftLabel.bottomAnchor, constant: ConstantSkill.swiftSkillTopAnchor).isActive = true
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
