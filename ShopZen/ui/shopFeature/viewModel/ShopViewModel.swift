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
            let vCategories = Categories(inListOfCategory: listOfCategory)
            getDelegate().configureCategoriesView(inListOfCategory: vCategories)
            }
        }

    /***/
    private(set) var itemsWithCategory : ItemsWithCategory!
        {
        didSet
            {
            // --------------------
            // A new list of items is received.
            // Immediately push it to the view
            // --------------------
            print("listOfItem set HELLO")
            getDelegate().pushListOfItem(inListOfItem: itemsWithCategory )
            getDelegate().pushNbOfItems(inNbOfItems: getNbOfItemStr(inNb: itemsWithCategory.listOfItem.count))
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
        //getDelegate().conf()
        callListOfItems()

        getDelegate().configureNavBar()
        getDelegate().configureCollectionView()
        }


    /**
     Called when user taps on an item in the UICollectionView
     Redirect it to the ItemDetailViewController
     */
    public func onItemTapped( inItemId : Int )
		{
		ZenLog.d("onItemTapped \(inItemId) ")
		guard 0 < inItemId else
			{
			getDelegate().popError(inErrorMsg: "Article inconnu")
			return
			}

		let vItemDetailVc = ItemDetailViewController()
        vItemDetailVc.modalPresentationStyle = .fullScreen
		vItemDetailVc.viewModel.item = itemsWithCategory.listOfItem.first(where:{ $0.id == inItemId } )
		getDelegate().goToItemViewDetail( inVc : vItemDetailVc )
		
		//getDelegate().goToDetailView( )
		}
    
   // private var currentCatId : Int = 0
    /**
     Called when user taps on a category
     Select the category and filter items by it
     */
    public func onCategoryTapped( inCatId : Int )
        {
        if( inCatId == 0 )
            {
            // ---------------
            // "All categories" button is tapped, display the whole list
            // ---------------
            getDelegate().pushListOfItem(inListOfItem: itemsWithCategory)
            getDelegate().pushNbOfItems(inNbOfItems: getNbOfItemStr(inNb: itemsWithCategory.listOfItem.count))
            }
        else
            {
            // ---------------
            // A category is tapped, filter the list and push it to the view
            // ---------------
            let vNewList = itemsWithCategory.listOfItem.filter { $0.categoryId == inCatId }
            let vOutItems = ItemsWithCategory(inListOfItem: vNewList)
            //itemsWithCategory = vOutItems
            getDelegate().pushListOfItem(inListOfItem: vOutItems)
            getDelegate().pushNbOfItems(inNbOfItems: getNbOfItemStr(inNb: vNewList.count))

            }
  
        }
    
    
    // MARK: - Toolbox
    
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
                self.listOfCategory = try inData.get().1
                self.itemsWithCategory = try inData.get().0
                
				}
			catch
				{
				self.getDelegate().popError( inErrorMsg: "TODO: ERROR ")
				}
			})
        }
    
    /**
     Format the number of items String
     */
    private func getNbOfItemStr( inNb : Int ) -> String
        {
        return "\(inNb) articles"
        }
    
    } // end of class --------------------------------------------------------------

//==============================================================================

 
