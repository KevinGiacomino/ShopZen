//
//  ShopViewModelTests.swift
//  ShopZenTests
//
//  Created by Spirtech on 13/05/2022.
//

import XCTest
import Combine
@testable import ShopZen

/**
 Holds all test case for the ShopViewModel class
 */
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
        // do
        let vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        MockAPIProvider.reqResult = .success(vCallResult)
        // when
        viewModel.callListOfItems(  )
        // then
		XCTAssertEqual(viewModel.listOfCategory, [])
		}
		
    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : listOfCategory should be [CategoryA, CategoryB]
     */
    func test_listOfCategoryPropertySetWithNotEmptyList()
        {
        // do
        var vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        let vListToTest = getStubbedCategoryList()
        vCallResult.1 = vListToTest
        MockAPIProvider.reqResult = .success(vCallResult)
        // when
        viewModel.callListOfItems(  )
        // then
        XCTAssertEqual(viewModel.listOfCategory, vListToTest)
        }

    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : itemsWithCategory should be []
     */
    func test_itemsWithCategoryPropertySetWithEmptyList()
        {
        // do
        let vEmptyItemsWithCat = ItemsWithCategory(inListOfItem: [])
        let vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (vEmptyItemsWithCat, [])
        MockAPIProvider.reqResult = .success(vCallResult)
        // when
        viewModel.callListOfItems(  )
        // zen
        XCTAssertEqual(viewModel.itemsWithCategory, vEmptyItemsWithCat)
        }
    
    
    /**
     CASE : Success mocked API call
     ATTEMPTED RESULT : itemsWithCategory should be ItemsWithCategory([Item], [Item])
     */
    func test_itemsWithCategoryPropertySetWithNotEmptyList()
        {
        // do
        var vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        let vToTest = getStubbedItemsWithCat()
        vCallResult.0 = vToTest
        MockAPIProvider.reqResult = .success(vCallResult)
        // when
        viewModel.callListOfItems(  )
        // then
        XCTAssertEqual(viewModel.itemsWithCategory, vToTest)
        }
    
    /**
     CASE : Pull to refresh action + success mocked API call
     ATTEMPTED RESULT : refreshMode should be set to FALSE
     */
    func test_refreshModeSetToFALSEWhenItemsReceived()
        {
        // do
        viewModel.refreshMode = true
        var vCallResult : (ItemsWithCategory, [ShopZen.Category]) = (ItemsWithCategory(inListOfItem: []), [])
        let vListToTest = getStubbedCategoryList()
        vCallResult.1 = vListToTest
        MockAPIProvider.reqResult = .success(vCallResult)
        // when
        viewModel.callListOfItems(  )
        // then
        XCTAssertEqual(viewModel.refreshMode, false)
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
        // do
        MockAPIProvider.reqResult = .failure(NSError(domain: "", code: -1))
        // when
        viewModel.callListOfItems()
        // then
        XCTAssertEqual(viewModel.listOfCategory, nil)
        }
		

    /**
     CASE : Failing API call
     ATTEMPTED RESULT : itemsWithCategory should be nil
     */
    func test_itemsWithCategoryPropertyNotSet()
        {
        // do
        MockAPIProvider.reqResult = .failure(NSError(domain: "", code: -1))
        // when
        viewModel.callListOfItems()
        // then
        XCTAssertEqual(viewModel.itemsWithCategory, nil)
        }
  
    /**
     CASE : Pull to refresh action + failing API call
     ATTEMPTED RESULT : refreshMode should be set to FALSE
     */
    func test_refreshModeSetToFALSEWhenItemsFailed()
        {
        // do
        viewModel.refreshMode = true
        MockAPIProvider.reqResult = .failure(NSError(domain: "", code: -1))
        // when
        viewModel.callListOfItems(  )
        // then
        XCTAssertEqual(viewModel.refreshMode, false)
        }
    
	} // end of class --------------------------------------------------------------

//==============================================================================

 

