//
//  ImageLoader.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/18/22.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(urlAddress: String) {
        guard let url = URL(string: urlAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
