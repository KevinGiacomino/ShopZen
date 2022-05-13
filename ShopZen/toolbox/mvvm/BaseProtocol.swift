//
//  BaseProtocol.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Parent class of each Delegate of your Application

	This class provide two useful methods which needs to be implemented by our View
	
		- displayWaitingAnimation() : Shows your own loader
		- hideWaitingAnimation()	: Hide your own loader
 */
@objc public protocol BaseProtocol
    {
   /// Should be completed with your own showing loader code
    func displayWaitingAnimation()
    /// Should be completed with your own hiding loader code
    func hideWaitingAnimation()
    
    } // end of class --------------------------------------------------------------

//==============================================================================
