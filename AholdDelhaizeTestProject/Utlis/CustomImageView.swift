//
//  CustomImageView.swift
//  AholdDelhaizeTestProject
//
//  Created by Sos Avetyan on 8/29/22.
//

import UIKit


class CustomImageView: UIImageView {
    
    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let newImage = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
