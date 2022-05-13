//
//  Extension+NetworkService.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import Foundation

/**
 Extension for NetworkService
 */
extension APIProviderOLD

	{
	/**
	 Generic call depending on WS path
	 */
	func requestAPI
        (
        inWS        : Urls.WSPath,
        completion  : @escaping (Result<Data,Error>) -> ()
        )
        {
        do
			{
			let vURL = try Urls.getAPIUrl( inWS: inWS ).get()
			URLSession.shared.dataTask(with: vURL) { (data, urlResponse, error) in
				// --------------
				// Error handling :
				// --------------
				if let outError = error
					{
					completion(.failure(outError))
					return
					}
				// --------------
				// Ensure that data is not empty :
				// --------------
				guard let vData = data else
					{
					completion(.failure(APIError.missingData))
					return
					}
				// Return the result
				completion(.success(vData))
		  
				}.resume()
			}
		catch
			{
			ZenLog.x("error: \(error.localizedDescription)")
			completion(.failure(APIError.invalidURL))
			}
        }
	}
