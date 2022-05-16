//
//  UIButton+Extension.swift
//  ShopZen
//
//  Created by Kevin on 11/05/2022.
//

import UIKit

/**
 Extension for UIButton
  
    - makeRoundedWithIcon : apply a rounded effect on an UIButton with an icon
 */
extension UIButton
    {
    
    /**
     Apply a rounded effect on an UIButton widget
     
        - parameter inBgColor:          (OPTIONAL) The color on the background of the view
        - parameter inCornerRadius:     (OPTIONAL) Radius of the rounded corner
        - parameter inImage:            The icon to display
        - parameter inShadowColor:      (OPTIONAL) The color of the shadow
        - parameter inShadowOpacity:    (OPTIONAL) The opacity of the shadow
     */
    func makeRoundedWithIcon
        (
        inImage         : UIImage,
        inBgColor       : UIColor       = .white,
        inCornerRadius  : CGFloat       = 25.0,
        inShadowColor   : CGFloat       = 0.3,
        inShadowOpacity : Float         = 0.5
        )
        {
        self.backgroundColor            = inBgColor
        self.layer.cornerRadius         = inCornerRadius
        self.setImage                   (inImage, for: .normal)
        self.imageView?.contentMode     = .scaleAspectFit
        self.imageEdgeInsets            = UIEdgeInsets(top: 13.0, left: 0.0, bottom: 13.0, right: 0.0)
        self.layer.shadowColor          = UIColor.black.cgColor
        self.layer.shadowRadius         = inShadowColor
        self.layer.shadowOpacity        = inShadowOpacity
        self.layer.shadowOffset         = CGSize(width: 1, height: 1)
        self.layer.masksToBounds        = false
        }
        
    }  // end of extension --------------------------------------------------------------

//==============================================================================


