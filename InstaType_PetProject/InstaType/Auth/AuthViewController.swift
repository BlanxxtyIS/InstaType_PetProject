//
//  AuthViewController.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 21.07.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    let oauth = OAuth2Service.shared
    
    private lazy var logoImage: UIImageView = {
       let image = UIImage(named: "Logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 155).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        return imageView
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.mBackground, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mBackground
        setupUI()
    }
    
    @objc
    private func loginButtonTapped() {
        let vc = WebViewViewController(delegate: self)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    private func setupUI() {
        view.addSubview(logoImage)
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70)
        ])
    }
}

extension AuthViewController: WebViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        oauth.load(code: code)
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        print("Qq")
    }
}
