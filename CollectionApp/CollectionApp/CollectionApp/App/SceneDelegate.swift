//
//  SceneDelegate.swift
//  CollectionApp
//
//  Created by Александр Холод on 19.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let menuVC = MenuViewController()
        let navigationController = UINavigationController(rootViewController: menuVC)
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}



