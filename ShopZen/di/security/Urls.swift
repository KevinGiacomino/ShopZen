//
//  AppKeys.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation


class Urls
    {
    
    private static let kAPI_URL          = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
    
    
    /***/
    public static func getAPIUrl() -> Result<URL,Error>
        {
        return Result { try convertToURL(inStr: kAPI_URL) }
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

