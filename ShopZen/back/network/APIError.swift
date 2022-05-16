//
//  APIError.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import Foundation

/**
 A list of all availables error concerning API calls with the server
 */
public enum APIError : Error
	{
    /// Internal error
	case internalError
    /// Error on the URL
	case invalidURL
    /// No data received by the server
	case missingData
    
	} // end of extension --------------------------------------------------------------

//==============================================================================


