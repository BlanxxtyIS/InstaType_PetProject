//
//  InstaTypeTabBarController.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 17.07.2024.
//

import UIKit

class InstaTypeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
    }
    
    private func setupViewControllers() {
        let instaTypeVC = createNewViewController(for: InstaTypeViewController(),
                                                  title: "",
                                                  imageName: "InstaType")
        let profileVC = createNewViewController(for: ProfileViewController(),
                                                title: "",
                                                imageName: "Profile")
        viewControllers = [instaTypeVC, profileVC]
    }
    
    private func createNewViewController(for rootViewController: UIViewController,
                                         title: String,
                                         imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
    
    private func setupTabBarAppearance() {
        view.backgroundColor = .mBackground
        UITabBar.appearance().barTintColor = .mBackground
        UITabBar.appearance().tintColor = .mWhite
        UITabBar.appearance().unselectedItemTintColor = .mLightMain
        UITabBar.appearance().backgroundColor = .mBackground
    }
}
