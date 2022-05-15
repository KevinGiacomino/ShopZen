//
//  ShopViewModelTests+Extension.swift
//  ShopZenTests
//
//  Created by Kevin on 15/05/2022.
//

import Foundation
@testable import ShopZen

/**
 Extension for ShopViewModelTests
 Retrieve combinaison of objects
 */
extension ShopViewModelTests
    {
    
    /**
     Gets a fake list of category
     */
    func getStubbedCategoryList() -> [ShopZen.Category]
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
    func getStubbedItemsWithCat() -> ItemsWithCategory
        {
        let outItemsWithCat : ItemsWithCategory = ItemsWithCategory(inListOfItem: [])
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

 
