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
        // TODO : REVOIR CE FILTRE,
        // SI URGENT > TRIER LES URGENT PAR DATE
        self.listOfItem = inListOfItem.sorted { (lhs, rhs) in
            let vLhs = lhs
            let vRhs = rhs
            // First if item is urgent sort it
            if vLhs.isUrgent == true { // <1>
                  return vLhs.isUrgent
                }
                
            return vLhs.dateOfCreation > vRhs.dateOfCreation// <2>
            }
        }

    } // end of extension --------------------------------------------------------------

//==============================================================================

