//
//  ViewModelFactory.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
class ViewModelFactory
    {
    
   // private var apiProvider  		: APIProvider?
    //private let shopViewModel   	: ShopViewModel?
   // private let itemDetailViewModel : ItemDetailViewModel?
    private static var instance		: ViewModelFactory?
    
    private lazy var apiProvider : APIProvider =
		{
		let outAPIProvider = APIProvider()
		return outAPIProvider
		}()
    
    /// Instance of the ShopViewModel
    public lazy var shopViewModel : ShopViewModel =
		{
		let outVm = ShopViewModel(inAPIProvider: apiProvider)
		return outVm
		}()
    
	/// Instance of the ItemDetailViewModel
    public lazy var itemDetailViewModel : ItemDetailViewModel =
		{
		let outVm = ItemDetailViewModel()
		return outVm
		}()
		
		
    init()
        {
        //apiProvider = APIProvider()
        //shopViewModel = ShopViewModel(inAPIProvider: apiProvider! )
        //itemDetailViewModel	= ItemDetailViewModel()
        }
    
    public static func shared() -> ViewModelFactory
        {
        if let vInstance = instance
            {
            instance = ViewModelFactory()
            return vInstance
            }
        return ViewModelFactory()
        }
    
    /*public func getShopViewModel() -> ShopViewModel
        {
        return shopViewModel!
        }
        
	  public func getItemDetailViewModel() -> ItemDetailViewModel
        {
        return itemDetailViewModel!
        }*/
    }
