//
//  Category.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
struct Category : Decodable
    {
    let id      : Int
    let name    : String
    
    /**
     List of all coding keys
     */
    enum CodingKeys: String, CodingKey
        {
        case id
        case name
        }
    
    } // end of extension --------------------------------------------------------------

//==============================================================================


