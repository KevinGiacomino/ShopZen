//
//  ItemDetailViewController.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
//

import Foundation

/**
 Item detail view
 This class is responsible to manages the UI of this view.
 It displays a list of Items
 */
class ItemDetailViewController        : BaseViewController<ItemDetailDelegate, ItemDetailViewModel>,
    ItemDetailDelegate
    {
    
	func displayWaitingAnimation()
        {
        
        }
    
    func hideWaitingAnimation()
        {
        }
    
        
    override func bindViewModelToView() -> ItemDetailViewModel
        {
        return ViewModelFactory.shared().itemDetailViewModel
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================
