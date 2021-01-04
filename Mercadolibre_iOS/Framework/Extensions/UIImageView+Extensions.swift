//
//  UIImageView+Extensions.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageFrom(url: String) {
        let url = URL(string: url)
        let scale = UIScreen.main.scale
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .scaleFactor(scale),
                .transition(.fade(1)),
            ])
    }
    
}
