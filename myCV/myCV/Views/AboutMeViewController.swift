//
//  AboutMeViewController.swift
//  myCV
//
//  Created by Александр Холод on 13.11.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    let myHobbies: UILabel = {
        let myHobbies = UILabel()
        myHobbies.text = "Мои увлечения 🔮"
        myHobbies.font = UIFont.boldSystemFont(ofSize: 25)
        myHobbies.translatesAutoresizingMaskIntoConstraints = false
        
        return myHobbies
    }()
    
    let imageBVB: UIImageView = {
        let imageBVB = UIImageView()
        imageBVB.image = UIImage(named: "logoBVB.png")
        imageBVB.contentMode = .scaleAspectFill
        imageBVB.translatesAutoresizingMaskIntoConstraints = false
        
        return imageBVB
    }()
    
    let bvbLabel: UILabel = {
        let bvbLabel = UILabel()
        bvbLabel.text = "Футбол"
        bvbLabel.font = .boldSystemFont(ofSize: 16)
        bvbLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return bvbLabel
    }()
    
    let imageSneaker: UIImageView = {
        let imageSneaker = UIImageView()
        imageSneaker.image = UIImage(named: "sneaker.png")
        imageSneaker.contentMode = .scaleAspectFill
        imageSneaker.translatesAutoresizingMaskIntoConstraints = false
        
        return imageSneaker
    }()
    
    let sneakerLabel: UILabel = {
        let sneakerLabel = UILabel()
        sneakerLabel.text = "Кроссовки"
        sneakerLabel.font = .boldSystemFont(ofSize: 16)
        sneakerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return sneakerLabel
    }()
    
    let imageMac: UIImageView = {
        let imageMac = UIImageView()
        imageMac.image = UIImage(named: "mac.png")
        imageMac.contentMode = .scaleAspectFill
        imageMac.translatesAutoresizingMaskIntoConstraints = false
        
        return imageMac
    }()
    
    let macLabel: UILabel = {
        let macLabel = UILabel()
        macLabel.text = "Техника"
        macLabel.font = .boldSystemFont(ofSize: 16)
        macLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return macLabel
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
        view.gradientLayer2(oneColor: primaryColor, twoColor: secondaryColor)
        view.addSubview(myHobbies)
        
        setupMyHobbies()
        setupLayout()
        setupImages()
    }
    
    func setupMyHobbies() {
        myHobbies.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myHobbies.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    func setupImages() {
        imageBVB.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageBVB.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        imageSneaker.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageSneaker.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        imageMac.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageMac.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupLayout() {
        let stackBVB = UIStackView(arrangedSubviews: [imageBVB, bvbLabel])
        stackBVB.translatesAutoresizingMaskIntoConstraints = false
        stackBVB.axis = .horizontal
        stackBVB.spacing = 10
        
        let stackSneaker = UIStackView(arrangedSubviews: [imageSneaker, sneakerLabel])
        stackSneaker.translatesAutoresizingMaskIntoConstraints = false
        stackSneaker.axis = .horizontal
        stackSneaker.spacing = 10
        
        let stackMac = UIStackView(arrangedSubviews: [imageMac, macLabel])
        stackMac.translatesAutoresizingMaskIntoConstraints = false
        stackMac.axis = .horizontal
        stackMac.spacing = 10
        
        let vStack = UIStackView(arrangedSubviews: [stackBVB, stackSneaker, stackMac])
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 10
        
        view.addSubview(vStack)
        
        vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        vStack.topAnchor.constraint(equalTo: myHobbies.bottomAnchor, constant: 20).isActive = true
    }

}


extension UIView {
    func gradientLayer2(oneColor: UIColor, twoColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [oneColor.cgColor, twoColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
