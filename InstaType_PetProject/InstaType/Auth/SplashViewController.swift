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
        var vc: UIViewController
        if UserDefaults.standard.string(forKey: "accessToken") == nil {
            vc = AuthViewController()
            vc.modalPresentationStyle = .fullScreen
        } else {
            vc = InstaTypeTabBarController()
            vc.modalPresentationStyle = .fullScreen
        }
        present(vc, animated: true)
    }
}
