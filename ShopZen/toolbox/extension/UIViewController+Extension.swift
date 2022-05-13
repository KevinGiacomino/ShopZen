//
//  UIViewController+Extension.swift
//  ShopZen
//
//  Created by Spirtech on 13/05/2022.
//

import Foundation
import UIKit

/**
 Extension for UIViewController
 
  - popDialog() : Pop an alert view with custom message
 */
extension UIViewController
	{
	/**
	
	 */
	public func popDialog
		(
		inTitle		: String,
		inMsg		: String,
		inWithOkBtn : Bool
		)
		{
		let vDialog = UIAlertController(title: inTitle, message: inMsg, preferredStyle: .alert)
		if( inWithOkBtn )
			{
			let vOk = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in })
			vDialog.addAction(vOk)
			}
        self.present(vDialog, animated: true, completion: nil)
		}
		
	} // end of extension --------------------------------------------------------------

//==============================================================================

