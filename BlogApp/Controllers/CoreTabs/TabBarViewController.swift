//
//  TabBarViewController.swift
//  BlogApp
//
//  Created by niab on Jan/22/22.
//

import UIKit

@available(iOS 15.0, *)
class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupController()
    }
    
    private func setupController() {
        
        guard let currentUserEmail = UserDefaults.standard.string(forKey: "email") else {
            return
        }
        
        let home =  HomeViewController()
        home.title = "Blogs Feed"
        
        
        let profile = ProfileViewController(currentEmail: currentUserEmail)
        profile.title = "Profile"
        
        home.navigationItem.largeTitleDisplayMode = .always
        profile.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: profile)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
  

}
