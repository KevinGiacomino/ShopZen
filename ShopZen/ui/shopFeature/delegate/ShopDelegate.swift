//
//  ShopDelegate.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Delegate responsible to communicate between ShopViewModel and the ShopViewController
 */
@objc protocol ShopDelegate : BaseProtocol
    {

    /**
     Configure the Main UI such as background color...
     */
    func configureMainUI        ( )
    
    /**
     Configure the info view which holds the number of items
     */
    func configureInfoView      ( )
    
    /**
    Configure the UI for the navigation bar
	 */
    func configureNavBar		(	)
    
    /**
     Configure the UICollectionView which holds items
     */
    func configureCollectionView (  )
    
    /**
     Should be called when received new set of items
     Prevent the view to update the list of items on view
     
      - parameter inListOfItems:	The received list of items to display
	 */
    func pushListOfItem
		(
		inListOfItem : ItemsWithCategory
		)
    
    /**
     Prevent the view that an error happened
     
      - parameter inErrorMsg:		The error message to display
	 */
    func popError
		(
		inErrorMsg : String
		)
    
    } // end of extension --------------------------------------------------------------

//==============================================================================


