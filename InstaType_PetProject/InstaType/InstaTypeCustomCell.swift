//
//  InstaTypeCustomCell.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 16.07.2024.
//

import UIKit

class InstaTypeCustomCell: UITableViewCell {
    static let reuseIdentifier = "InstaType"
    
    lazy var instaImage: UIImageView = {
        let image = UIImage(named: "")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(instaImage)
        NSLayoutConstraint.activate([instaImage.topAnchor.constraint(equalTo: contentView.topAnchor),
                                     instaImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                     instaImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                     instaImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
}

