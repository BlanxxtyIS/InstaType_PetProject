//
//  ProfileSettingsViewController.swift
//  PartyRoulette
//
//  Created by Марат Хасанов on 17.07.2024.
//

import UIKit

class ProfileSettingsViewController: UIViewController {
    
    var userDataModel = UserDataModel.shared
    
    private lazy var settingsTitle: UILabel = {
        let title = UILabel()
        title.text = "Settings"
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var profileImage: UIImageView = {
        let profileImage = userDataModel.image
        let imageView = UIImageView(image: profileImage)
        imageView.heightAnchor.constraint(equalToConstant: 146).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 146).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var usernameTitle: UILabel = {
       let label = UILabel()
        label.text = "Username"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let username = UITextField()
        username.placeholder = "Username"
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    
    private lazy var genderTitle: UILabel = {
       let label = UILabel()
        label.text = "Gender"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderTextField: UITextField = {
        let username = UITextField()
        username.placeholder = "Male"
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()

    private lazy var rateUsBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .mOrange
        view.heightAnchor.constraint(equalToConstant: 103).isActive = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 23
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rateUsEmojiBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.heightAnchor.constraint(equalToConstant: 64).isActive = true
        view.widthAnchor.constraint(equalToConstant: 64).isActive = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rateUsEmoji: UIImageView = {
       let image = UIImage(named: "⭐")
        let imageView = UIImageView(image: image)
        imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rateUsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Rate Us!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .mBackground
        view.addSubview(settingsTitle)
        view.addSubview(profileImage)
        view.addSubview(usernameTitle)
        view.addSubview(usernameTextField)
        view.addSubview(genderTitle)
        view.addSubview(genderTextField)
        view.addSubview(rateUsBackground)
        rateUsBackground.addSubview(rateUsEmojiBackground)
        rateUsBackground.addSubview(rateUsLabel)
        rateUsBackground.addSubview(rateUsEmoji)
        rateUsEmojiBackground.addSubview(rateUsEmoji)

        NSLayoutConstraint.activate([
            settingsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            settingsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileImage.topAnchor.constraint(equalTo: settingsTitle.bottomAnchor, constant: 22),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameTitle.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 38),
            usernameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor, constant: 8),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            genderTitle.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
            genderTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            genderTextField.topAnchor.constraint(equalTo: genderTitle.bottomAnchor, constant: 8),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            rateUsBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            rateUsBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            rateUsBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            rateUsBackground.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 8),
            
            rateUsEmojiBackground.leadingAnchor.constraint(equalTo: rateUsBackground.leadingAnchor, constant: 20),
            rateUsEmojiBackground.topAnchor.constraint(equalTo: rateUsBackground.topAnchor, constant: 20),
            
            rateUsEmoji.centerYAnchor.constraint(equalTo: rateUsBackground.centerYAnchor),
            rateUsEmoji.centerXAnchor.constraint(equalTo: rateUsBackground.centerXAnchor),
            
            rateUsLabel.centerYAnchor.constraint(equalTo: rateUsBackground.centerYAnchor),
            rateUsLabel.leadingAnchor.constraint(equalTo: rateUsEmojiBackground.trailingAnchor, constant: 20)
        ])
    }
}
