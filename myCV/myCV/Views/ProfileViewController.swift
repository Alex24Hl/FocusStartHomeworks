//
//  ProfileViewController.swift
//  myCV
//
//  Created by Александр Холод on 13.11.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
    
   private let welcomeLabel : UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "👋🏻 Hello!"
        welcomeLabel.font = .boldSystemFont(ofSize: 25)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return welcomeLabel
    }()
    
    private let myImage: UIImageView = {
        let myImage = UIImageView()
        myImage.image = UIImage(named: "myImage.jpg")
        myImage.contentMode = .scaleAspectFill

        myImage.translatesAutoresizingMaskIntoConstraints = false
        
        return myImage
    }()
    
    private let education: UILabel = {
        let education = UILabel()
        education.text = "\tМеня зовут Александр Холод. Мне 23 года. Я окончил Донской Государственный Технический Университет по направлению автоматизация технологических процессов и производств.\n \t В конце обучения я понял, что хочу сменить вектор развития и начать изучать программирование. Приблизительно так я и пришел к iOS-разработке).  "
        education.numberOfLines = 0
        education.font = UIFont.systemFont(ofSize: 16)
        education.textAlignment = .justified
        education.translatesAutoresizingMaskIntoConstraints = false
        
        return education
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
        view.gradientLayer(firstColor: primaryColor, secondColor: secondaryColor)
        
        view.addSubview(welcomeLabel)
        view.addSubview(myImage)
        view.addSubview(education)
        
        setupWelcomeLabel()
        setupImage()
        setupEducation()
    }
    
    private func setupWelcomeLabel() {
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    private func setupImage() {
        let screenSize = UIScreen.main.bounds
        myImage.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20).isActive = true
        myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myImage.heightAnchor.constraint(equalToConstant: screenSize.height * 0.3).isActive = true
        myImage.widthAnchor.constraint(equalToConstant: screenSize.width * 0.45).isActive = true
    }
    
    private func setupEducation() {
        education.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        education.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        education.topAnchor.constraint(equalTo: myImage.bottomAnchor, constant: 30).isActive = true
    }

}

extension UIView {
    func gradientLayer(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
