//
//  UIView+Extension.swift
//  ShopZen
//
//  Created by Kevin on 09/05/2022.
//

import UIKit


extension UIView
    {
    public func addSubViews( _ inViews : UIView... )
        {
        for vView in inViews
            {
            self.addSubview(vView)
            }
        }
    }
