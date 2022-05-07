//
//  ImageUrl.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

struct ImageUrl : Decodable
    {
    let small, thumb : String
        
    /**
     List of all coding keys
     */
    enum CodingKeys: String, CodingKey
        {
        case small
        case thumb
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================

