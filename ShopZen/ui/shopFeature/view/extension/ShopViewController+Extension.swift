//
//  ShopViewController+Extension.swift
//  ShopZen
//
//  Created by Spirtech on 13/05/2022.
//

import UIKit

/**
 Extension for ShopViewController
 Additionaly UI methods
 */
extension ShopViewController
	{
	
	/**
	 Configure UI for a category button
	 
		- parameter inTitle : The title of the button
	 */
	func createCatBtn
		(
		inTitle : 	String
		) -> UIButton
        {
        let outBtn 	= UIButton()
        outBtn		.setTitleColor(.darkGray, for: .normal)
        outBtn		.setTitle(inTitle, for: .normal)
        outBtn		.backgroundColor = .clear
        outBtn		.layer.cornerRadius = 10
        outBtn		.layer.borderWidth = 1
        outBtn		.titleLabel?.font =  UIFont.systemFont(ofSize: 14)
        outBtn		.sizeToFit()
        outBtn		.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
		outBtn		.addTarget(self, action: #selector(onCategoryTapped), for: .touchUpInside)
        //outBtn.showsTouchWhenHighlighted = true

       // button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        outBtn		.layer.borderColor = ColorPalette.AccentColor.cgColor
        return 		outBtn
        }
        
	/**
	 Apply custom UI for selected category button
	 
		- parameter inBtn	: The instance of the button to apply the selected UI
	 */
	func setCatBtnSelectedUI
		(
		inBtn : UIButton
		)
        {
        inBtn	.setTitleColor(.white, for: .normal)
        inBtn	.backgroundColor = ColorPalette.AccentColor
        inBtn	.isSelected = true
        // Avoid double taps
        inBtn	.isEnabled = false
        }

    /**
     Apply custom UI for un selected category button
     
      - parameter inBtn	: The instance of the button to apply the selected UI
     */
	func setCatBtnUnSelectedUI
		(
		inBtn : UIButton
		)
        {
        inBtn	.setTitleColor(.white, for: .normal)
        inBtn	.backgroundColor = .clear
        inBtn	.setTitleColor(.darkGray, for: .normal)
        inBtn	.isEnabled = true
        }

	} // end of extension --------------------------------------------------------------

//==============================================================================
