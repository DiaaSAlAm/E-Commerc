//
//  ExUIKit-IBDesignable+Localize.swift
//  e-commerce
//
//  Created by Diaa SALAM on 21/09/2022.
//

import UIKit



@IBDesignable public extension UILabel {
    @IBInspectable var localizeKey: String? {
        get {
            return self.text
        }
        
        set {
            self.text = newValue?.localized
        }
    }
}



@IBDesignable public extension UIButton {
    @IBInspectable var localizeKey: String? {
        get { self.titleLabel?.text }
        
        set {
            self.setTitle(newValue?.localized, for: .normal)
        }
    }
}

