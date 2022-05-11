//
//  ShopDelegate.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import UIKit

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
    func configureCategoriesView      ( inListOfCategory : Categories )
    
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
     Push the number of items for the actual catogory
     
       - parameter inNbOfItems:     The value of the number of items
     */
    func pushNbOfItems( inNbOfItems : String )
    
    /**
     Prevent the view that an error happened
     
      - parameter inErrorMsg:		The error message to display
	 */
    func popError
		(
		inErrorMsg : String
		)
		
		
	/**
	 Redirect user to the detailled view of the item
	 
	  - parameter inVc:			Instance of the ItemDetailViewController
	 */
	func goToItemViewDetail( inVc : UIViewController )
    
    } // end of extension --------------------------------------------------------------

//==============================================================================


