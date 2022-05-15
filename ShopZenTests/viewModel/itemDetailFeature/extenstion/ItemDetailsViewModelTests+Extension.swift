//
//  ItemDetailsViewModelTests+Extension.swift
//  ShopZenTests
//
//  Created by Kevin on 15/05/2022.
//

import Foundation
@testable import ShopZen

/**
 Extension for ItemDetailViewModelTests
 Retrieve combinaison of Item object
 */
extension ItemDetailViewModelTests
    {
    
    /**
     Retuns a stubbed Item object with a correct image Url
     */
    func getStubbedItemWithCorrectUrl() -> Item
        {
        let outItem = Item(id: 1, categoryId: 1, title: "itemA", description: "descA", creationDate: "", price: 10.0, imagesUrl: ["thumb":"https://gorilasoftware.com.br/wp-content/uploads/2021/11/Lorem-Ipsum-768x492-1.png"], isUrgent: false)
        return outItem
        }
    
    /**
     Retuns a stubbed Item object with an incorrect image Url
     */
    func getStubbedItemWithIncorrectUrl() -> Item
        {
        let outItem = Item(id: 1, categoryId: 1, title: "itemA", description: "descA", creationDate: "", price: 10.0, imagesUrl: ["thumb":"thisisanincorrecturl"], isUrgent: false)
        return outItem
        }
    
    /**
     Returns a correctly filled stubbed Item object
     */
    func getStubbedItem() -> Item
        {
        var outItem = getStubbedItemWithCorrectUrl()
        outItem.categoryName = "catA"
        return outItem
        }
    
    /**
     Returns a stubbed item with an incorrect image URL
     */
    func getItemWithIncorrectImageURL() -> Item
        {
        var outItem = getStubbedItemWithIncorrectUrl()
        outItem.categoryName = "catA"
        return outItem
        }
    
    /**
     Returns a stubbed item with an incorrect image URL
     */
    func getItemWithGoodImageUrlButNotCategory() -> Item
        {
        let outItem = getStubbedItemWithCorrectUrl()
        return outItem
        }
   
    /**
     Returns a stubbed item with a category name but incorrect image url
     */
    func getItemWithCategoryNameButIncorrectImageUrl() -> Item
        {
        var outItem = getStubbedItemWithIncorrectUrl()
        outItem.categoryName = "catA"
        return outItem
        }
    
    /**
     Returns an Item without category name setted.
     Simply retourne item from getStubbedItem() method
     */
    func getItemWithoutCategoryName() -> Item
        {
        return getStubbedItemWithCorrectUrl()
        }
    
    
    } // end of class --------------------------------------------------------------

//==============================================================================

