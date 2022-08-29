//
//  ItemCollectionViewCell.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/17/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    private var avatarImageView: UIImageView = {
        var avatarView = UIImageView()
        avatarView.contentMode = .scaleAspectFit
        return avatarView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        avatarImageView = UIImageView()
        contentView.backgroundColor = .white
        contentView.addSubview(avatarImageView)
        makeImageViewContraints()
    }
    
    private func makeImageViewContraints() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0),
            avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0.0),
            avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    func displayItem(item: CollectionUI) {
        avatarImageView.loadFrom(urlAddress: item.imageURL)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
