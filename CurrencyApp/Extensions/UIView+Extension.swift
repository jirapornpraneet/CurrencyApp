//
//  UIView+Extension.swift
//  CurrencyApp
//
//  Created by Piesoft on 18/3/2566 BE.
//

import Foundation
import UIKit

extension UIView {
    
    func setupCorner(_ radius: CGFloat = 10) {
        self.layoutIfNeeded()
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setupBorder(_ color: UIColor = .lightGray, width: CGFloat = 2) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
    
}
