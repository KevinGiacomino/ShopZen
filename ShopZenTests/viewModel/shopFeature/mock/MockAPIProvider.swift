//
//  MockAPIProvider.swift
//  ShopZenTests
//
//  Created by Kevin on 14/05/2022.
//

import Foundation
import Combine
@testable import ShopZen


/**
 A mock representation of APIProviderProtocol
 */
final class MockAPIProvider: APIProviderProtocol
    {
    
    public static var reqResult : Result<(ItemsWithCategory, [ShopZen.Category]), Error> = .failure(NSError(domain: "", code: -1))
    
    static func fetchItems(completion: @escaping (Result<(ItemsWithCategory, [ShopZen.Category]), Error>) -> ())
        {
        completion(reqResult)
        }

    } // end of class --------------------------------------------------------------

//==============================================================================

 
