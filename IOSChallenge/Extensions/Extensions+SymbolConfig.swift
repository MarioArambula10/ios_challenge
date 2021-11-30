//
//  Extensions+SymbolConfig.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 22.11.2021.
//

import UIKit

extension UIImage.SymbolConfiguration {
    
    convenience init(pointSize: CGFloat) {
        self.init(pointSize: pointSize, weight: .regular, scale: .large)
    }

    convenience init(pointSize: CGFloat, weight: UIImage.SymbolWeight) {
        self.init(pointSize: pointSize, weight: weight, scale: .large)
    }

    func image(named name: String) -> UIImage? {
        UIImage(systemName: name, withConfiguration: self)
    }
}
