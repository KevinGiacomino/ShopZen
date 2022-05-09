//
//  PaddingLabel.swift
//  ShopZen
//
//  Created by Kevin on 09/05/2022.
//

import UIKit


/**
 Subclass of UILabel
 Allowing to apply padding around an UILabel
 */
class PaddingLabel: UILabel
    {

    var edgeInset: UIEdgeInsets = .zero

    override func drawText(in rect: CGRect)
        {
        let insets = UIEdgeInsets.init(top: edgeInset.top, left: edgeInset.left, bottom: edgeInset.bottom, right: edgeInset.right)
        super.drawText(in: rect.inset(by: insets))
        }

    override var intrinsicContentSize: CGSize
        {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + edgeInset.left + edgeInset.right, height: size.height + edgeInset.top + edgeInset.bottom)
        }
        
    } // end of class --------------------------------------------------------------

//==============================================================================
