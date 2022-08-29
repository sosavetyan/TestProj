//
//  CollectionDomain.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/18/22.
//

import Foundation


struct CollectionDomain {
    let labelText: String
    let imageURL: String
    let description: String
    
    func makeUIModel() -> CollectionUI {
        let collectionUI = CollectionUI(labelText: labelText, imageURL: imageURL, desc: description)
        return collectionUI
    }
}
