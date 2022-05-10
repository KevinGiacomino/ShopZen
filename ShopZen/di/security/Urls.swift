//
//  AppKeys.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Class responsible to provide the API URL
 */
class Urls
    {
    
    /**
     List of all availables web services
     */
    public enum WSPath : String
        {
        case LISTINGS = "listing.json"
        case CATEGORY = "categories.json"
        }
    
    /// Base URL
    private static let kBASE_URL          = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
    
    
    /**
     */
    public static func getAPIUrl
        (
        inWS : WSPath
        ) -> Result<URL,Error>
        {
        return Result { try convertToURL(inStr: kBASE_URL).appendingPathComponent( inWS.rawValue) }
        }

    /**
	 */
    private static func convertToURL( inStr : String ) throws -> URL
        {
        guard let outURL = URL(string: inStr) else { throw "no API URL given" }
        return outURL
        }
        
    
    } // end of class --------------------------------------------------------------

//==============================================================================

