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
        avatarImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        avatarImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func displayItem(item: CollectionUI) {
        avatarImageView.loadFrom(urlAddress: item.imageURL)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
