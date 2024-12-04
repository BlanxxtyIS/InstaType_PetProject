import UIKit
import StoreKit

class ProfileSettingsViewController: UIViewController {
    
    var userDataModel = UserDataModel.shared
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalToConstant: 48).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var settingsTitle: UILabel = {
        let title = UILabel()
        title.text = "Settings"
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 28, weight: .regular)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var profileImage: UIImageView = {
        let profileImage = userDataModel.image
        let imageView = UIImageView(image: profileImage)
        imageView.heightAnchor.constraint(equalToConstant: 146).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 146).isActive = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 73
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imageCircleBackground: UIButton = {
        let image = UIImage(named: "addImageIcon")
        let button = UIButton()
        button.heightAnchor.constraint(equalToConstant: 74).isActive = true
        button.widthAnchor.constraint(equalToConstant: 74).isActive = true
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 37
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var usernameTitle: UILabel = {
       let label = UILabel()
        label.text = "Username"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var usernameTextField: UITextField = {
        let username = UITextField()
        
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.frame = CGRect(x: 10, y: 0, width: 18, height: 18)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 18))
        imageView.center.y = paddingView.center.y
        paddingView.addSubview(imageView)
        
        username.leftView = paddingView
        username.leftViewMode = .always
        
        username.placeholder = "Username"
        username.backgroundColor = .mGray
        username.heightAnchor.constraint(equalToConstant: 56).isActive = true
        username.layer.masksToBounds = true
        username.layer.cornerRadius = 22
        
        username.text = userDataModel.name
        username.font = .systemFont(ofSize: 15, weight: .bold)
        
        username.addTarget(self, action: #selector(editUsername), for: .editingChanged)
        
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    
    private lazy var genderTitle: UILabel = {
       let label = UILabel()
        label.text = "Gender"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderTextField: UITextField = {
        let username = UITextField()
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.frame = CGRect(x: 10, y: 0, width: 18, height: 18)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 18))
        imageView.center.y = paddingView.center.y
        paddingView.addSubview(imageView)
        
        username.leftView = paddingView
        username.leftViewMode = .always
        
        username.placeholder = "Username"
        username.backgroundColor = .mGray
        username.heightAnchor.constraint(equalToConstant: 56).isActive = true
        username.layer.masksToBounds = true
        username.layer.cornerRadius = 22
        
        username.text = userDataModel.gender
        username.font = .systemFont(ofSize: 15, weight: .bold)
        
        username.addTarget(self, action: #selector(editGender), for: .editingChanged)
        
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()

    private lazy var middleLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .mGrayLight
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rateUsButton: RateUsButton = {
       let button = RateUsButton()
        button.addTarget(self, action: #selector(rateAppButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc
    private func rateAppButtonTapped() {
        guard let currentScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        SKStoreReviewController.requestReview(in: currentScene)
    }
    
    @objc
    private func editUsername(_ textField: UITextField) {
        userDataModel.name = textField.text
    }
    
    @objc
    private func editGender(_ textField: UITextField) {
        userDataModel.gender = textField.text
    }
    
    @objc private func changeProfileImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .mBackground
        view.addSubview(settingsTitle)
        view.addSubview(backButton)
        view.addSubview(profileImage)
        view.addSubview(imageCircleBackground)
        view.addSubview(usernameTitle)
        view.addSubview(usernameTextField)
        view.addSubview(genderTitle)
        view.addSubview(genderTextField)
        view.addSubview(middleLineView)
        view.addSubview(rateUsButton)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.centerYAnchor.constraint(equalTo: settingsTitle.centerYAnchor),
            
            settingsTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            settingsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        
            profileImage.topAnchor.constraint(equalTo: settingsTitle.bottomAnchor, constant: 22),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageCircleBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageCircleBackground.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 108),
            
            usernameTitle.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 38),
            usernameTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            usernameTextField.topAnchor.constraint(equalTo: usernameTitle.bottomAnchor, constant: 4),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            genderTitle.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
            genderTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            genderTextField.topAnchor.constraint(equalTo: genderTitle.bottomAnchor, constant: 4),
            genderTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            genderTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            middleLineView.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: 20),
            middleLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            rateUsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            rateUsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            rateUsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            rateUsButton.topAnchor.constraint(equalTo: middleLineView.bottomAnchor, constant: 20)
        ])
    }
}

extension ProfileSettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImage.image = selectedImage
            userDataModel.image = selectedImage
        }
    }
}
