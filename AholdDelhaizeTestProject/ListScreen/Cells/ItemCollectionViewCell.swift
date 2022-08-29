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
        avatarView.contentMode = .scaleAspectFit

        return avatarView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        avatarImageView = CustomImageView()
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        makeImageViewContraints()
    }
    
    private func makeImageViewContraints() {
        NSLayoutConstraint.activate([
            avatarImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0),
            avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
            avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0),
            avatarImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0.0)
        ])
    }
    
    func displayItem(item: CollectionUI) {
        if let url = URL(string: item.imageURL) {
            avatarImageView.loadImage(from: url)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
