//
//  Github.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import Foundation
import Combine
import UIKit


protocol APIProviderProtocol
    {
    static func fetchItems( completion : @escaping (Result<(ItemsWithCategory, [Category]), Error>) -> () )
    //static func fetchListOfItem() -> AnyPublisher<[Item], Error>
   // static func fetchListOfCategory() -> AnyPublisher<[Category], Error>
    }

/**
 
 */
class APIProvider : APIProviderProtocol
	{
		
    // MARK: - Class variables
        
	/// Instance of the APIClient
    static let apiClient    		= APIClient()
    /// Should be the result of the network calls
    static var subscription 		: AnyCancellable?
    /// Tuple that should contains ItemsWithCategory and [Category] object
	static var outItemsAndCat 		: (ItemsWithCategory, [Category] )?
	
	
    // MARK: - Public methods
        
        
	/**
	 Requesting server to obtain the list of available items also the list of available category
	 
	 Items holds a category id, so we need to retrieve the associated category name in [Category]
	 For accomplish it the two network calls will be called in parralel using the iOS Combine framework
	 Once all data received, call the mergeItemsWithCategory() method to obtain an outputted merged list
	 
		- parameter completion : Result will be returned asynchronously through Result<(ItemsWithCategory, 		[Category]), Error>
	 */
    public static func fetchItems
		(
		completion : @escaping (Result<(ItemsWithCategory, [Category]), Error>) -> ()
		)
		{
		// Fetch list of category
		let vCategories 	    = APIProvider.fetchListOfCategory()
		// Fetch list of item
		let vItems 			    = APIProvider.fetchListOfItem()
    
		subscription			= Publishers.Zip(vCategories, vItems)
			.sink(receiveCompletion: { (suscriberCompletion) in
				switch suscriberCompletion
					{
					case .finished:
						print("finished")
						// ------------
						// All operations are done
						// ------------
						guard let vOutItemsAndCat = outItemsAndCat else
							{
							// ------------
							// Error handling : no items found
							// Return an internal error
							// ------------
							completion(.failure(APIError.internalError))
							return
							}
						completion(.success(vOutItemsAndCat))
					  break
					case .failure(let error):
						// ------------
						// Error handling : an unexcepted erreur happened
						// Return the result of the error
						// ------------
						ZenLog.x("FAILUUURE : \(error.localizedDescription)")
						completion(.failure(error))
						break
					}
					
				}) { (categories, items) in
			
				// --------------
				// Datas correctly received
				// Merge the two datas and assign to variable
				// --------------
                let vMergedItemsWithCat = mergeItemsWithCategory(inItems:items, inCategories: categories)
				outItemsAndCat = (vMergedItemsWithCat, categories)
				}
		}
    

	} // end of class --------------------------------------------------------------

//==============================================================================

 
	
	
