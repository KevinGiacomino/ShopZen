//
//  String+Extension.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Extension for String
 
    - errorDescription  : Allows to accept LocalizedError as a Stirng
    - isValidURL        : Return TRUE if the String is a valid URL
 */
extension String: LocalizedError
    {
    /***/
    public var errorDescription: String? { return self }
    /***/
    var isValidURL: Bool
        {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
            {
            return match.range.length == self.utf16.count
            }
        else
            {
            return false
            }
        }
    
    } // end of extension --------------------------------------------------------------

//==============================================================================



