//
//  InstaTypeCustomCell.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 16.07.2024.
//

import UIKit

class InstaTypeCustomCell: UITableViewCell {
    static let reuseIdentifier = "InstaType"
    
    private var isLiked: Bool = false {
        didSet {
            let imageName = isLiked ? "Active" : "No Active"
            likeButton.setImage(UIImage(named: imageName), for: .normal)
        }
    }
    
    private lazy var likeButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "No Active"), for: .normal)
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var instaImage: UIImageView = {
        let image = UIImage(named: "")
        let imageView = UIImageView(image: image)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.text = "15 июля 2024"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(image name: String, date: String) {
        let image = UIImage(named: name)
        instaImage.image = image
        
        dateLabel.text = date
    }
    
    @objc
    private func likeButtonTapped() {
        isLiked.toggle()
    }
    
    private func setupCell() {
        contentView.addSubview(instaImage)
        contentView.addSubview(likeButton)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            instaImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            instaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            instaImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            instaImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

