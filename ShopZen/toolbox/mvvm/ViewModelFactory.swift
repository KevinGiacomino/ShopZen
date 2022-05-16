//
//  ViewModelFactory.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Engine of the view model
 Entry point to retrieve instance of each view model for this project
 */
class ViewModelFactory
    {

    // MARK: - Instance
	
	/// Instance of this class
	static let shared: ViewModelFactory =
		{
        let outInstance = ViewModelFactory()
        return outInstance
		}()

    /// Instance of the ShopViewModel
    public lazy var shopViewModel : ShopViewModel =
		{
		let outVm = ShopViewModel()
		return outVm
		}()
    
	/// Instance of the ItemDetailViewModel
    public lazy var itemDetailViewModel : ItemDetailViewModel =
		{
		let outVm = ItemDetailViewModel()
		return outVm
		}()
		
        
    } // end of extension --------------------------------------------------------------

//==============================================================================
