//
//  SpashViewController.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 26.07.2024.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = (UserDefaults.standard.string(forKey: "accessToken") != nil) ? InstaTypeTabBarController() : AuthViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
