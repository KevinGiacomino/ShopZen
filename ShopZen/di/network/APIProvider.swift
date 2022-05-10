//
//  Github.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
//

import Foundation
import Combine
import UIKit


/**
 
 */
class APIProvider
	{
    static let apiClient    = APIClient()
    static var subscription : AnyCancellable?

    public static func fetchItems(completion : @escaping (Result<(ItemsWithCategory, [Category]), Error>) -> ())
		{
		let vCategories 	    = APIProvider.fetchListOfCategory()
		let vItems 			    = APIProvider.fetchListOfItem()
    
		let vParralled 			= Publishers.Zip(vCategories, vItems)
		  //.receive(on: RunLoop.main, options: nil)
			.sink(receiveCompletion: { (suscriberCompletion) in
			   switch suscriberCompletion {
				case .finished:
					print("finished")
							 // do something that you want to do when finished
				  break
				case .failure(let error):
					print("FAILUUURE : \(error.localizedDescription)")
				 completion(.failure(error))
				}
					
			}) { (categories, items) in
		
                let outItemsWithCat = mergeItemsWithCategory(inItems:items, inCategories: categories)
                let outItemsAndCat = (outItemsWithCat, categories)

				completion(.success(outItemsAndCat))
			}
		//vT.cancel()
		//vT.store(in: &subscription)
		RunLoop.main.run(until: Date(timeIntervalSinceNow: 1))
		}
    
  
    
	} // end of class --------------------------------------------------------------

//==============================================================================

 
	
	
