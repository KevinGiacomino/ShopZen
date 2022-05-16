//
//  Categories.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import UIKit

/*
 Class holding a list of Category object
 This class respect the Objective-C object representation that allows us to use it on protocol methods
 */
class Categories : NSObject
    {
    
      
    // MARK: - Properties

    var listOfCategory : [Category]
    
      
    // MARK: - Constructor

    /**
     Main constructor
     */
    init( inListOfCategory : [Category] )
        {
        listOfCategory = inListOfCategory
        }

    } // end of extension --------------------------------------------------------------

//==============================================================================

