//
//  ItemDetailDelegate.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
//

import Foundation


/**
 Delegate responsible to communicate between ItemDetailViewModel and the ItemDetailViewController
 */
@objc protocol ItemDetailDelegate : BaseProtocol
    {
    
    /**
     Setup the view with some data from current Item
     
	    - parameter inImgUrl:	The URL of the background image
	    - parameter inIsUrgent:	TRUE if the item is marked such as Urgent
	    - parameter inTitle: 	The title of the item
	    - parameter inCatName:	The category name
	    - parameter inDesc: 	The description of the item
	    - parameter inPrice: 	The price formatted of the item
	    - parameter inDate: 	The date of creation of the item
	 */
	func configureItemView
		(
		inImgURL 	: 			URL,
		inIsUrgent	:			Bool,
		inTitle		: 			String,
		inCatName	: 			String,
		inDesc  	: 			String,
		inPrice 	: 			String,
		inDate		: 			String
		)
    
    /**
     Allows to close the view (e.g: when user taps on the back button)
     */
    func closeThisView()
    
    /**
     Shares item around social network
     */
    func shareItemToSocialNetwork()
    
    } // end of extension --------------------------------------------------------------

//==============================================================================


