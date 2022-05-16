//
//  Category.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Representing an Category object
 */
struct Category : Decodable, Equatable
    {
    
    // MARK: - Properties

    let id      : Int
    let name    : String
    
    // MARK: - Coding keys
    
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


