//
//  UIButton+Extension.swift
//  ShopZen
//
//  Created by Kevin on 11/05/2022.
//

import UIKit

/**
 Extension for UIButton
 */
extension UIButton
    {
    func makeRoundedWithIcon
        (
        inBgColor       : UIColor = .white,
        inCornerRadius  : Int = 25,
        inImage         : UIImage
        )
        {
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
        self.setImage(inImage, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 13.0, left: 0.0, bottom: 13.0, right: 0.0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 0.3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
        }
    }
