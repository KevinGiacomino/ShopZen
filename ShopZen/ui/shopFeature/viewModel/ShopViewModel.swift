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
    
    /// Flag avoid duplicate process call, set to TRUE when a network call is called
    private var isBusy      = false
    /// Instance of APIProvider, should be easily switching to a Mock class for Unit Testing
    private var apiProvider :  APIProviderProtocol.Type     = APIProvider.self
        
    /**
	 Will be filled after requesting resources
	 */
    private(set) var listOfCategory : [Category]!
        {
        didSet
            {
            let vCategories 		= Categories(inListOfCategory: listOfCategory)
            viewModelDelegate?		.configureCategoriesView(inListOfCategory: vCategories)
            }
        }

    /**
	 Will be filled after requesting resources
	 */
    private(set) var itemsWithCategory : ItemsWithCategory!
        {
        didSet
            {
            // --------------------
            // A new list of items is received.
            // Immediately push it to the view
            // --------------------
            print("listOfItem set HELLO")
            viewModelDelegate?	.pushListOfItem(inListOfItem: itemsWithCategory )
            viewModelDelegate?	.pushNbOfItems(inNbOfItems: getNbOfItemStr(inNb: itemsWithCategory.listOfItem.count))
            }
        }
    
    
    // MARK: - Constructor
    
    /**
     Special constructor for Unit testing
     */
    init( inApiProvider : APIProviderProtocol.Type = APIProvider.self)
        {
        self.apiProvider = inApiProvider
        }
    
    
    // MARK: - Public methods
    
    /***/
    override func onAttach()
        {
        viewModelDelegate?	.configureMainUI()
        viewModelDelegate?	.configureNavBar()
        viewModelDelegate?	.configureCollectionView()
        callListOfItems		( )
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
            viewModelDelegate?.popError(inErrorMsg: AppStrings.kUnknownItem)
			return
			}

		let vItemDetailVc 		= ItemDetailViewController()
        vItemDetailVc			.modalPresentationStyle = .fullScreen
		vItemDetailVc			.viewModel.item = itemsWithCategory.listOfItem.first(where:{ $0.id == inItemId } )
        viewModelDelegate?		.goToItemViewDetail( inVc : vItemDetailVc )
		}
    
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
            refreshData		(inListOfItem: itemsWithCategory, inNbOfItem: getNbOfItemStr(inNb: itemsWithCategory.listOfItem.count))
            }
        else
            {
            // ---------------
            // A category is tapped, filter the list and push it to the view
            // ---------------
            let vNewList	= itemsWithCategory.listOfItem.filter { $0.categoryId == inCatId }
            let vOutItems 	= ItemsWithCategory(inListOfItem: vNewList)
            //itemsWithCategory = vOutItems
            refreshData		(inListOfItem: vOutItems, inNbOfItem: getNbOfItemStr(inNb: vNewList.count))
            }
  
        }
    
    
    // MARK: - Toolbox
    
    /**
     Calling APIProvider to obtain the whole list of items
     */
    func callListOfItems()
        {
        if( !isBusy )
			{
			isBusy = true
			// Initalize the request
            apiProvider.fetchItems(completion: {
				// -----------
				// A new set of data has been received
				// -----------
				(inData) in
				self.isBusy = false
				do
					{
					// --------------
					// No error, assign the result to variables
					// --------------
					self		.listOfCategory 		= try inData.get().1
					self		.itemsWithCategory 	    = try inData.get().0
					}
				catch
					{
					// --------------
					// Error handling, display an error
					// --------------
                    ZenLog.x("Exception: \(error.localizedDescription)")
                    self.viewModelDelegate?.popError( inErrorMsg: AppStrings.kNoItemsFound)
					}
				})
			}
        }
    
    /**
     Refresh the items in UICollectionView
     */
    private func refreshData
        (
        inListOfItem    : ItemsWithCategory,
        inNbOfItem      : String
        )
        {
        viewModelDelegate?	.pushListOfItem	( inListOfItem: 	inListOfItem	)
        viewModelDelegate?	.pushNbOfItems	( inNbOfItems: 		inNbOfItem		)
        }
    
    /**
     Format the number of items String
     */
    private func getNbOfItemStr
		(
		inNb : Int
		) -> String
        {
        return "\(inNb) articles"
        }
    
    } // end of class --------------------------------------------------------------

//==============================================================================


