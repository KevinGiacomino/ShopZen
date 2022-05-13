//
//  UIBarButtonItem+Extension.swift
//  ShopZen
//
//  Created by Spirtech on 12/05/2022.
//

import UIKit

/**
 Extension for UIBarButtonItem
 
  - Add new constructor allowing to put image and title
 */
extension UIBarButtonItem
	{
    convenience init(image :UIImage, title :String, target: Any?, action: Selector?, inTintColor : UIColor = ColorPalette.AccentColor )
		{
        let vBtn 	= UIButton(type: .custom)
        vBtn		.setImage(image, for: .normal)
        vBtn		.setTitle(title, for: .normal)
        vBtn		.tintColor = inTintColor
        vBtn		.setTitleColor( inTintColor, for: .normal)
        vBtn		.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)

        if let vTarget = target, let vAction = action
			{
            vBtn	.addTarget(vTarget, action: vAction, for: .touchUpInside)
			}

        self.init(customView: vBtn)
		}
		
	} // end of extension --------------------------------------------------------------

//==============================================================================


