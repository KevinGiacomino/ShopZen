//
//  ItemDetailViewModelTests.swift
//  ShopZenTests
//
//  Created by Kevin on 14/05/2022.
//

import XCTest
@testable import ShopZen

/**
 Holds all test case for the ItemDetailView class
 */
class ItemDetailViewModelTests: XCTestCase
    {
    
    // MARK: - Class variables
    var viewModel           : ItemDetailViewModel!
    
    // MARK: - Initialization methods

    /**
     Called before test
     Initialize all variables for testing
     */
    override func setUp()
        {
        super.setUp()
        viewModel   = ItemDetailViewModel()
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
    
    
    //TODO : CHECK if itemIsCompliant
    
    // MARK: ------------------------
    // MARK: - SUCCESS tests
    // MARK: ------------------------
    
    /**
     CASE : Fill Item with nil data
     ATTEMPTED RESULT : isItemCompliant should be false
     */
    func test_itemCorrectlySet()
        {
        // do
        let vIsCompliant : Item?  = getStubbedItem()
        viewModel.item = vIsCompliant
        // when
        viewModel.checkIfItemIsCompliant()
        // then
        XCTAssertEqual(viewModel.isItemCompliant, true)
        }
    
    // MARK: ------------------------
    // MARK: - FAILURE tests
    // MARK: ------------------------
    
    /**
     CASE : Fill Item with nil data
     ATTEMPTED RESULT : isItemCompliant should be false
     */
    func test_itemSetToNil()
        {
        // do
        let vNotCompliantItem : Item?  = nil
        viewModel.item = vNotCompliantItem
        // when
        viewModel.checkIfItemIsCompliant()
        // then
        XCTAssertEqual(viewModel.isItemCompliant, false)
        }
    
    /**
     CASE : Fill Item without category name
     ATTEMPTED RESULT : isItemCompliant should be false
     */
    func test_itemSetWithEmptyCategoryName()
        {
        // do
        let vNotCompliantItem : Item?  = getItemWithoutCategoryName()
        viewModel.item = vNotCompliantItem
        // when
        viewModel.checkIfItemIsCompliant()
        // then
        XCTAssertEqual(viewModel.isItemCompliant, false)
        }
    
    /**
     CASE : Fill Item with a correct image url but without category name
     ATTEMPTED RESULT : isItemCompliant should be false
     */
    func test_itemSetWithGoodURLAndEmptyCategoryName()
        {
        // do
        let vNotCompliantItem : Item?  = getItemWithGoodImageUrlButNotCategory()
        viewModel.item = vNotCompliantItem
        // when
        viewModel.checkIfItemIsCompliant()
        // then
        XCTAssertEqual(viewModel.isItemCompliant, false)
        }
    
    /**
     CASE : Fill Item with an incorrect image URL
     ATTEMPTED RESULT : isItemCompliant should be false
     */
    func test_itemSetWithIncorrectImageUrl()
        {
        // do
        let vNotCompliantItem : Item?  = getItemWithIncorrectImageURL()
        viewModel.item = vNotCompliantItem
        // when
        viewModel.checkIfItemIsCompliant()
        // then
        XCTAssertEqual(viewModel.isItemCompliant, false)
        }
    
    /**
     CASE : Fill Item with a category name and an incorrect image URL
     ATTEMPTED RESULT : isItemCompliant should be false
     */
    func test_itemSetWithCategoryNameAndIncorrectImageUrl()
        {
        // do
        let vNotCompliantItem : Item?  = getItemWithCategoryNameButIncorrectImageUrl()
        viewModel.item = vNotCompliantItem
        // when
        viewModel.checkIfItemIsCompliant()
        // then
        XCTAssertEqual(viewModel.isItemCompliant, false)
        }
    
    } // end of class --------------------------------------------------------------

//==============================================================================

 
