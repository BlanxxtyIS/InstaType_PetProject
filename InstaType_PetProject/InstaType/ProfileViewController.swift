//
//  ProfileViewController.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 16.07.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileImage: UIImageView = {
        let image = UIImage(named: "Photo")
        let imageView = UIImageView(image: image)
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var profileUserNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Хасанов Марат"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .mWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginUserLabel: UILabel = {
        let label = UILabel()
        label.text = "@blanxxty"
        label.textColor = .mWhite
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userText: UILabel = {
        let label = UILabel()
        label.text = "Hello, world!"
        label.textColor = .mWhite
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Exit"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mBackground
        profileSetup()
    }
    
    private func profileSetup() {
        view.addSubview(profileImage)
        view.addSubview(profileUserNameLabel)
        view.addSubview(loginUserLabel)
        view.addSubview(userText)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            exitButton.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            profileUserNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileUserNameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8),
            
            loginUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginUserLabel.topAnchor.constraint(equalTo: profileUserNameLabel.bottomAnchor, constant: 8),
            
            userText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userText.topAnchor.constraint(equalTo: loginUserLabel.bottomAnchor, constant: 8)
        ])
    }
}
