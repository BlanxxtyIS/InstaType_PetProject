import UIKit

class CongratilationsViewController: UIViewController {
    
    //MARK: - Private Methods
    var image: String = ""
    
    private lazy var blureBackgroundImage: UIImageView = {
       let image = UIImage(named: "blureViewController")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mBackgroundOrange
        view.layer.cornerRadius = 27
        view.heightAnchor.constraint(equalToConstant: 343).isActive = true
        view.widthAnchor.constraint(equalToConstant: 343).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var congratilationsBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .mOrangeOpacity
        view.layer.cornerRadius = 25
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        view.widthAnchor.constraint(equalToConstant: 321).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.text = "Congratilations"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emojiBackground: UIView = {
       let view = UIView()
        view.backgroundColor = .mWhiteOpacity
        view.heightAnchor.constraint(equalToConstant: 76).isActive = true
        view.widthAnchor.constraint(equalToConstant: 76).isActive = true
        view.layer.cornerRadius = 38
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var droppedEmoji: UIImageView = {
       let image = UIImage(named: image)
        let imageView = UIImageView(image: image)
        imageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rouletteHalfImage: UIImageView = {
       let image = UIImage(named: "RouletteImageHalf")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var letsGoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Let's Go!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .mOrange
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        button.layer.cornerRadius = 27
        button.addTarget(self, action: #selector(letsGoButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private Methods
    @objc
    private func letsGoButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupUI() {
        view.addSubview(blureBackgroundImage)
        view.addSubview(backgroundView)
        backgroundView.addSubview(congratilationsBackground)
        congratilationsBackground.addSubview(resultLabel)
        congratilationsBackground.addSubview(emojiBackground)
        emojiBackground.addSubview(droppedEmoji)
        view.addSubview(rouletteHalfImage)
        view.addSubview(letsGoButton)
        
        setupUIConstraints()
    }
    
    private func setupUIConstraints() {
        NSLayoutConstraint.activate([
            blureBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            blureBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blureBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blureBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            congratilationsBackground.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12),
            congratilationsBackground.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 11),
            congratilationsBackground.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -11),
            
            resultLabel.centerYAnchor.constraint(equalTo: congratilationsBackground.centerYAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: congratilationsBackground.leadingAnchor, constant: 25),
            
            emojiBackground.centerYAnchor.constraint(equalTo: congratilationsBackground.centerYAnchor),
            emojiBackground.trailingAnchor.constraint(equalTo: congratilationsBackground.trailingAnchor, constant: -14),
            
            droppedEmoji.centerYAnchor.constraint(equalTo: emojiBackground.centerYAnchor),
            droppedEmoji.centerXAnchor.constraint(equalTo: emojiBackground.centerXAnchor),
            
            rouletteHalfImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            rouletteHalfImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            
            letsGoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            letsGoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            letsGoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -19)
        ])
    }
}
