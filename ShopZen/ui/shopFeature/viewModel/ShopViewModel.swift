//
//  ShopViewModel.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation
import Combine

/**
 View model for Shop Feature
 Holds the logic of the ShopViewController
 */
class ShopViewModel : BaseViewModel<ShopDelegate>
    {
    
    
    // MARK: - Private methods
    
    //var apiProvider : APIProvider?
    
    private(set) var listOfCategory : [Category]!
        {
        didSet
            {
                
            }
        }

    /***/
    private(set) var listOfItem : ItemsWithCategory!
        {
        didSet
            {
            // --------------------
            // A new list of items is received.
            // Immediately push it to the view
            // --------------------
            print("listOfItem set HELLO")
            getDelegate().pushListOfItem(inListOfItem: listOfItem )
            }
        }
    
    
    // MARK: - Consctrutor
    
    init
        (
        inAPIProvider : APIProvider
        )
        {
        // TODO: CHECK IF WE CAN REMOVE IT
        //apiProvider   = inAPIProvider
        }
    
    // MARK: - Public methods
    
    override func onAttach()
        {
        getDelegate().configureMainUI()
        getDelegate().configureInfoView()
        getDelegate().configureNavBar()
        getDelegate().configureCollectionView()
		callListOfItems()
        }


    /**
     Called when user taps on an item in the UICollectionView
     Redirect it to the ItemDetailViewController
     */
    public func onItemTapped( inIndex : Int )
		{
		ZenLog.d("onItemTapped\(inIndex)")
		}
    
    /***/
    private func callListOfItems()
        {
		/*guard let vNetworkService = networkService else { return }
        do
            {
            try vNetworkService .fetchListOfCategory { (inData) in self.listOfCategory = inData }
            }
        catch
            {
            print("ERROR: \(error.localizedDescription)")
            }*/
    
    
		APIProvider.fetchItems(completion: {
			(inData) in
			do
				{
                self.listOfItem = try inData.get().0
				}
			catch
				{
				self.getDelegate().popError( inErrorMsg: "TODO: ERROR ")
				}
			})
        }
    
    
    } // end of class --------------------------------------------------------------

//==============================================================================

 
