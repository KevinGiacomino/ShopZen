//
//  ShopViewModelTests.swift
//  ShopZenTests
//
//  Created by Spirtech on 13/05/2022.
//

import XCTest
import Combine
@testable import ShopZen

/***/
class ShopViewModelTests: XCTestCase
	{
    // MARK: - Class variables
	var viewModel           : ShopViewModel!
    
    // MARK: - Initialization methods

    /**
     Called before test
     Initialize all variables for testing
     */
  	override func setUp()
		{
		super.setUp()
        viewModel           = ShopViewModel(inApiProvider: MockAPIProvider.self)
		}
    
    /**
     Called after test
     Reset all variables
     */
	override func tearDown()
		{
		viewModel = nil
		super.tearDown()
		}
		
    
    // MARK: ------------------------
    // MARK: - SUCCESS tests
    // MARK: ------------------------
    
    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : listOfCategory should be []
     */
	func test_listOfCategoryPropertySetWithEmptyList()
		{
        let vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        MockAPIProvider.reqResult = .success(vCallResult)
        viewModel.callListOfItems(  )
		XCTAssertEqual(viewModel.listOfCategory, [])
		}
		
    // TODO: TEST AVC VRAI CATEGORY
    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : listOfCategory should be [CategoryA, CategoryB]
     */
    func test_listOfCategoryPropertySetWithNotEmptyList()
        {
        var vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        let vListToTest = getMockedCategoryList()
        vCallResult.1 = vListToTest
        MockAPIProvider.reqResult = .success(vCallResult)
        viewModel.callListOfItems(  )
        XCTAssertEqual(viewModel.listOfCategory, vListToTest)
        }

    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : itemsWithCategory should be []
     */
    func test_itemsWithCategoryPropertySetWithEmptyList()
        {
        let vEmptyItemsWithCat = ItemsWithCategory(inListOfItem: [])
        let vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (vEmptyItemsWithCat, [])
        MockAPIProvider.reqResult = .success(vCallResult)
        viewModel.callListOfItems(  )
        XCTAssertEqual(viewModel.itemsWithCategory, vEmptyItemsWithCat)
        }
    
    
    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : itemsWithCategory should be ItemsWithCategory([Item], [Item])
     */
    func test_itemsWithCategoryPropertySetWithNotEmptyList()
        {
        var vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        let vToTest = getMockedItemsWithCat()
        vCallResult.0 = vToTest
        MockAPIProvider.reqResult = .success(vCallResult)
        viewModel.callListOfItems(  )
        XCTAssertEqual(viewModel.itemsWithCategory, vToTest)
        }
    
    // MARK: ------------------------
    // MARK: - FAILURE tests
    // MARK: ------------------------
    
    
    /**
     CASE : Failing API call
     ATTEMPTED RESULT : listOfCategory should be nil
     */
    func test_listOfCategoryPropertyNotSet()
        {
        // Simulate an error during the API call
        MockAPIProvider.reqResult = .failure(NSError(domain: "", code: -1))
        // Call the API
        viewModel.callListOfItems()
        // Check result
        XCTAssertEqual(viewModel.listOfCategory, nil)
        }
		

    /**
     CASE : Failing API call
     ATTEMPTED RESULT : itemsWithCategory should be nil
     */
    func test_itemsWithCategoryPropertyNotSet()
        {
        // Simulate an error during the API call
        MockAPIProvider.reqResult = .failure(NSError(domain: "", code: -1))
        // Call the API
        viewModel.callListOfItems()
        // Check result
        XCTAssertEqual(viewModel.itemsWithCategory, nil)
        }
    
    // MARK: - Toolbox
    
    /**
     Gets a fake list of category
     */
    private func getMockedCategoryList() -> [ShopZen.Category]
        {
        var outCategories : [ShopZen.Category] = []
        let vCategoryA = Category(id: 1, name: "categoryA")
        let vCategoryB = Category(id: 2, name: "categoryB")
        outCategories.append(vCategoryA)
        outCategories.append(vCategoryB)
        return outCategories
        }

    
    /**
     Gets a fake list of items
     */
    private func getMockedItemsWithCat() -> ItemsWithCategory
        {
        var outItemsWithCat : ItemsWithCategory = ItemsWithCategory(inListOfItem: [])
        var vListOfItems :  [Item] = []
        let vItemA = Item(id: 1, categoryId: 1, title: "itemA", description: "descA", creationDate: "", price: 10.0, imagesUrl: ["" : ""], isUrgent: false)
        let vItemB = Item(id: 1, categoryId: 1, title: "itemB", description: "descB", creationDate: "", price: 10.0, imagesUrl: ["": ""], isUrgent: true)
        vListOfItems.append(vItemA)
        vListOfItems.append(vItemB)
        outItemsWithCat.listOfItem = vListOfItems
        return outItemsWithCat
        }
    
	} // end of class --------------------------------------------------------------

//==============================================================================

 

