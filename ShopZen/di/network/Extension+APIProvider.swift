//
//  Extension+apipROVIDER.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
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
     
     */
    public static func mergeItemsWithCategory
        (
        inItems         : [Item],
        inCategories    : [Category]
        ) -> ItemsWithCategory
        {
            
        let outItems = inItems.map { item -> Item in
        guard let vCategory = inCategories.first(where: { $0.id == item.categoryId }) else { return item }
            var vItem = item
            vItem.categoryName = vCategory.name
            return vItem
            }
        return ItemsWithCategory(inListOfItem: outItems)
        }
    

    
    /**
     Generic methods
	 */
    private static func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error>
		{
        return apiClient.run(request)
            .map(\.value)
			.receive(on: RunLoop.main)
            .eraseToAnyPublisher()
		}
    
    }
