//
//  AppDelegate.swift
//  Bankey
//
//  Created by Maybelline Rivas on 8/23/23.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let loginViewController = LoginViewController() // We need to keep a reference to this view controller
    let onboardingViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        
        registerForNotifications()
        
        displayLogin()
        
        return true
    }

    private func registerForNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    private func displayLogin(){
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen(){
        
        if LocalState.hasOnboarded{
            prepMainView()
            setRootViewController(mainViewController)
        }
        else{
            setRootViewController(onboardingViewController)
        }
    }
    
    private func prepMainView(){
        
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        
    }
}
extension AppDelegate: LoginViewControllerDelegate{
    func didLogin() {
        displayNextScreen()
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else{
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        
    }
}

extension AppDelegate: LogoutDelegate{
    @objc func didLogout() {
        setRootViewController(loginViewController)
    }
}
