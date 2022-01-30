//
//  AppDelegate.swift
//  BlogApp
//
//  Created by niab on Jan/22/22.
//
import Purchases
import Firebase
import UIKit

@available(iOS 15.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //TODO: Firebase
        FirebaseApp.configure()
        
        //TODO: Purchases RevenueCat
        //Purchases.configure(withAPIKey: "mgByuJPTRCAzIyGwIATAhYNgsUXpNcZB")
        
        //IAPManager.shared.getSubscriptionStatus(completion: nil)
    
        
        
        //TODO: Update VC to sign in VC if not signed in
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc: UIViewController
        if AuthManager.shared.isSignedIn {
            vc = TabBarViewController()
        } else {
            let signInVC = SignInViewController()
            signInVC.navigationItem.largeTitleDisplayMode = .always
            
            let navVC = UINavigationController(rootViewController: signInVC)
            navVC.navigationBar.prefersLargeTitles = true
            
            vc = navVC
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        
        
        
        return true
    }
    
    
}

