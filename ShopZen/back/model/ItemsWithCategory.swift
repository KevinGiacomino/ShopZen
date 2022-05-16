//
//  Items.swift
//  ShopZen
//
//  Created by Kevin on 09/05/2022.
//

import Foundation

/**
 Class holding a list of Item object merged with it category
 This class respect the Objective-C object representation that allows us to use it on protocol methods
 */
class ItemsWithCategory : NSObject
    {
    
      
    // MARK: - Properties

    var listOfItem : [Item]
    
      
    // MARK: - Constructor

	/**
	 Main constructor
	 */
    init( inListOfItem : [Item] )
        {
        // -----------------
        // Sort the items to to up those whose flag is marked as urgent
        // Also filter items by their date of creation
        // -----------------
        self.listOfItem = inListOfItem.sorted { (lhs, rhs) in
            let vLhs = lhs
            let vRhs = rhs
            // Sort by "urgent" parameter
            if vLhs.isUrgent == true { // <1>
                  return vLhs.isUrgent
                }
            // Then sort by their date of creation
            return vLhs.dateOfCreation > vRhs.dateOfCreation// <2>
            }
        }

    } // end of extension --------------------------------------------------------------

//==============================================================================

