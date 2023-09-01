//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Maybelline Rivas on 8/30/23.
//

import UIKit

extension UIViewController{
    
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
            //let navBarAppearance = UINavigationBarAppearance()
            //navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
            //navBarAppearance.backgroundColor = appColor
            //UINavigationBar.appearance().standardAppearance = navBarAppearance
            //UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        }
    
    func setTabBarImage(imageName: String, title: String){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
