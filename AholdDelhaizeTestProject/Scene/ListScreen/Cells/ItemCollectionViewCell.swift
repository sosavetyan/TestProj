//
//  ItemCollectionViewCell.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/17/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    private var avatarImageView: CustomImageView = {
        var avatarView = CustomImageView()
        avatarView.contentMode = .scaleToFill
        return avatarView
    }()
    
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        makeViewConstraints()
    }
    
    private func makeViewConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0),
            avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
            avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 200.0),
            nameLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 10.0),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0)
        ])
    }
    
    func displayItem(item: CollectionUI) {
        if let url = URL(string: item.imageURL) {
            avatarImageView.loadImage(from: url)
        }
        nameLabel.text = item.labelText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
