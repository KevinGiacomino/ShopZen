//
//  ShopViewController.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation


/**
 Main view
 This class is responsible to manages the UI of this view.
 It displays a list of Items
 */
class ShopViewController     : BaseViewController<ShopDelegate, ShopViewModel>,
    ShopDelegate
    {
    
    
    
    
    
    func initializeUI()
        {
        
        }
    
    func displayWaitingAnimation()
        {
        
        }
    
    func hideWaitingAnimation()
        {
        }
    
        
    override func bindViewModelToView() -> ShopViewModel
        {
        return ViewModelFactory.shared().getShopViewModel()
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================
