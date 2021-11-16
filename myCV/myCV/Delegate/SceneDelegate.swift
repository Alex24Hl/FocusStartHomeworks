//
//  SceneDelegate.swift
//  myCV
//
//  Created by Александр Холод on 12.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let tabs = self.createTabs()
        window.rootViewController = tabs
        self.window = window
        window.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    
    func createTabs() -> UITabBarController {
        let tabBar = UITabBarController()
        let welcomeVC = ProfileViewController()
        let skillVC = SkillViewController()
        let aboutmeVC = AboutMeViewController()
        
        welcomeVC.tabBarItem = createWelcomeTab() as? UITabBarItem
        skillVC.tabBarItem = createSkillTab() as? UITabBarItem
        aboutmeVC.tabBarItem = aboutMeTab() as? UITabBarItem
        
        tabBar.setViewControllers([welcomeVC, skillVC, aboutmeVC], animated: false)
        return tabBar
        
    }
    
    func createWelcomeTab() -> UIBarItem {
        let item = UITabBarItem(title: "Welcome", image: UIImage(systemName: "hand.wave"), tag: 0)
        return item
    }
    
    func createSkillTab() -> UIBarItem {
        let item = UITabBarItem(title: "Skills", image: UIImage(systemName: "graduationcap"), tag: 1)
        return item
    }
    
    func aboutMeTab() -> UIBarItem {
        let item = UITabBarItem(title: "Me", image: UIImage(systemName: "eyes"), tag: 2)
        return item
    }
}

