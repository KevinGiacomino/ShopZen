//
//  AppKeys.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
class Urls
    {
    
    /**
     List of all availables web services
     */
    public enum WS : String
        {
        case LISTINGS = "listing.json"
        case CATEGORY = "categories.json"
        }
    
    private static let kAPI_URL          = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
    
    
    /***/
    public static func getAPIUrl
        (
        inWS : WS
        ) -> Result<URL,Error>
        {
        return Result { try convertToURL(inStr: kAPI_URL + inWS.rawValue) }
        }

    /***/
    private static func convertToURL( inStr : String ) throws -> URL
        {
        guard let outURL = URL(string: inStr) else { throw "no API URL given"
                
            }
        return outURL
        }
        
    
    } // end of class --------------------------------------------------------------

//==============================================================================

