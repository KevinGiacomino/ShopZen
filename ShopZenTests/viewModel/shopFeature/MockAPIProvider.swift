//
//  MockAPIProvider.swift
//  ShopZenTests
//
//  Created by Kevin on 14/05/2022.
//

import Foundation
import Combine
@testable import ShopZen


// your mock implementation for testing
final class MockAPIProvider: APIProviderProtocol
    {
    
    public static var reqResult : Result<(ItemsWithCategory, [ShopZen.Category]), Error> = .failure(NSError(domain: "", code: -1))
    
    static func fetchItems(completion: @escaping (Result<(ItemsWithCategory, [ShopZen.Category]), Error>) -> ())
        {
        completion(reqResult)
        }

    //var listOfCategory : [Category]?
    }
