//
//  AboutMeViewController.swift
//  myCV
//
//  Created by Александр Холод on 13.11.2021.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    private enum ConstantAboutMe {
        static let myHobbiesSize: CGFloat = 25
        static let myHobbiesTopAnchor: CGFloat = 20
        
        static let bvbLabelSize: CGFloat = 16
        static let imageBVBWidthAnchor: CGFloat = 80
        static let imageBVBHeightAnchor: CGFloat = 80
        
        static let sneakerLabelSize: CGFloat = 16
        static let imageSneakerWidthAnchor: CGFloat = 80
        static let imageSneaketHeightAnchor: CGFloat = 80
        
        static let macLabelSize: CGFloat = 16
        static let imageMacWidthAnchor: CGFloat = 80
        static let imageMacHeightAnchor: CGFloat = 80
        
        static let stackBVBSpacing: CGFloat = 10
        static let stackSneakerSpacing: CGFloat = 10
        static let stackMacSpacing: CGFloat = 10
        
        static let vStackSpacing: CGFloat = 10
        static let vStackLeadingAnchor: CGFloat = 20
        static let vStackTralingAnchor: CGFloat = -20
        static let vStackTopAnchor: CGFloat = 20
    }
    
    private let myHobbies: UILabel = {
        let myHobbies = UILabel()
        myHobbies.text = "Мои увлечения 🔮"
        myHobbies.font = UIFont.boldSystemFont(ofSize: ConstantAboutMe.myHobbiesSize)
        myHobbies.translatesAutoresizingMaskIntoConstraints = false
        
        return myHobbies
    }()
    
    private let imageBVB: UIImageView = {
        let imageBVB = UIImageView()
        imageBVB.image = UIImage(named: "logoBVB.png")
        imageBVB.contentMode = .scaleAspectFill
        imageBVB.translatesAutoresizingMaskIntoConstraints = false
        
        return imageBVB
    }()
    
    private let bvbLabel: UILabel = {
        let bvbLabel = UILabel()
        bvbLabel.text = "Футбол"
        bvbLabel.font = .boldSystemFont(ofSize: ConstantAboutMe.bvbLabelSize)
        bvbLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return bvbLabel
    }()
    
    private let imageSneaker: UIImageView = {
        let imageSneaker = UIImageView()
        imageSneaker.image = UIImage(named: "sneaker.png")
        imageSneaker.contentMode = .scaleAspectFill
        imageSneaker.translatesAutoresizingMaskIntoConstraints = false
        
        return imageSneaker
    }()
    
    private let sneakerLabel: UILabel = {
        let sneakerLabel = UILabel()
        sneakerLabel.text = "Кроссовки"
        sneakerLabel.font = .boldSystemFont(ofSize: ConstantAboutMe.sneakerLabelSize)
        sneakerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return sneakerLabel
    }()
    
    private let imageMac: UIImageView = {
        let imageMac = UIImageView()
        imageMac.image = UIImage(named: "mac.png")
        imageMac.contentMode = .scaleAspectFill
        imageMac.translatesAutoresizingMaskIntoConstraints = false
        
        return imageMac
    }()
    
    private let macLabel: UILabel = {
        let macLabel = UILabel()
        macLabel.text = "Техника"
        macLabel.font = .boldSystemFont(ofSize: ConstantAboutMe.macLabelSize)
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
    
    private func setupMyHobbies() {
        myHobbies.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myHobbies.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: ConstantAboutMe.myHobbiesTopAnchor).isActive = true
    }
    
    private func setupImages() {
        imageBVB.widthAnchor.constraint(equalToConstant: ConstantAboutMe.imageBVBWidthAnchor).isActive = true
        imageBVB.heightAnchor.constraint(equalToConstant: ConstantAboutMe.imageBVBHeightAnchor).isActive = true
        
        imageSneaker.widthAnchor.constraint(equalToConstant: ConstantAboutMe.imageSneakerWidthAnchor).isActive = true
        imageSneaker.heightAnchor.constraint(equalToConstant: ConstantAboutMe.imageSneaketHeightAnchor).isActive = true
        
        imageMac.widthAnchor.constraint(equalToConstant: ConstantAboutMe.imageMacWidthAnchor).isActive = true
        imageMac.heightAnchor.constraint(equalToConstant: ConstantAboutMe.imageMacHeightAnchor).isActive = true
    }
    
    private func setupLayout() {
        let stackBVB = UIStackView(arrangedSubviews: [imageBVB, bvbLabel])
        stackBVB.translatesAutoresizingMaskIntoConstraints = false
        stackBVB.axis = .horizontal
        stackBVB.spacing = ConstantAboutMe.stackBVBSpacing
        
        let stackSneaker = UIStackView(arrangedSubviews: [imageSneaker, sneakerLabel])
        stackSneaker.translatesAutoresizingMaskIntoConstraints = false
        stackSneaker.axis = .horizontal
        stackSneaker.spacing = ConstantAboutMe.stackSneakerSpacing
        
        let stackMac = UIStackView(arrangedSubviews: [imageMac, macLabel])
        stackMac.translatesAutoresizingMaskIntoConstraints = false
        stackMac.axis = .horizontal
        stackMac.spacing = ConstantAboutMe.stackMacSpacing
        
        let vStack = UIStackView(arrangedSubviews: [stackBVB, stackSneaker, stackMac])
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = ConstantAboutMe.vStackSpacing
        
        view.addSubview(vStack)
        
        vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantAboutMe.vStackLeadingAnchor).isActive = true
        vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantAboutMe.vStackTralingAnchor).isActive = true
        vStack.topAnchor.constraint(equalTo: myHobbies.bottomAnchor, constant: ConstantAboutMe.vStackTopAnchor).isActive = true
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
