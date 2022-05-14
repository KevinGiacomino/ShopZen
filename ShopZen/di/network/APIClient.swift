//
//  APIClient.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import UIKit
import Combine

/**
 Generic object allowing to run a network call using the Combine framework
 This object also hold some networking configuration
 */
struct APIClient
	{
    let session = URLSession.shared
    
    /**
     Generic Response object holding :
		- a Value that will be decoded
		- a Response that represents the network call response
	 */
    struct Response<T>
		{
        let value: T
        let response: URLResponse
		}
    
    /**
     Generic methods to run any network call and easily decode it into Object
     */
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error>
		{
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let outValue = try decoder.decode(T.self, from: result.data)
                return Response(value: outValue, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
		}
		
	} // end of extension --------------------------------------------------------------

//=============================================================================
