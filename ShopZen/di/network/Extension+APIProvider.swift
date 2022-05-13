//
//  Extension+apipROVIDER.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import UIKit
import Combine

/**
 Extension for APIProvider class
 Defining the main call methods
 */
extension APIProvider
	{
	
	/**
	 Request server to obtain the list of item
	 
		- Returns Result delivered through AnyPublisher
	 */
	static func fetchListOfItem() -> AnyPublisher<[Item], Error>
		{
		do
			{
			let vUrl = try Urls.getAPIUrl(inWS: Urls.WSPath.LISTINGS).get()
			return run(URLRequest(url: vUrl))
			}
		catch
			{
			return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
			}
		}
		
	/**
	 Request server to obtain the list of category
	 
		- Returns Result delivered through AnyPublisher
	 */
	static func fetchListOfCategory() -> AnyPublisher<[Category], Error>
		{
     	do
			{
			let vUrl = try Urls.getAPIUrl(inWS: Urls.WSPath.CATEGORY).get()
			return run(URLRequest(url: vUrl))
			}
		catch
			{
			return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
			}
		}

    /**
     Merge each item with his associated category.
     Sets the "categoryName" to Item object with the name of the founded category
     
        - parameter inItems : 		The list of items to merge
        - parameter inCategories :	The list of categories to retrieve the associated category
	
	    - Returns  					The formatted list
     */
    public static func mergeItemsWithCategory
        (
        inItems : 					[Item],
        inCategories : 				[Category]
        ) -> ItemsWithCategory
        {
            
        let outItems = inItems.map
			{ item -> Item in
			guard let vCategory = inCategories.first(where: { $0.id == item.categoryId }) else { return item }
			var vItem = item
            vItem.categoryName = vCategory.name
            return vItem
            }
        return ItemsWithCategory(inListOfItem: outItems)
        }
    

    
    /**
     Generic methods to send API request and obtain result
     
        - Returns Result delivered through AnyPublisher
	 */
    private static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error>
		{
        return apiClient.run(request)
            .map(\.value)
			.receive(on: DispatchQueue.main) // DispatchQueue allowing to load while CollectionView is scrolling
            .eraseToAnyPublisher()
		}
    
    } // end of extension --------------------------------------------------------------

//=============================================================================
