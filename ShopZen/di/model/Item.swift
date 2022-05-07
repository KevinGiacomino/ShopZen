//
//  Item.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
struct Item : Decodable
    {
    let id, categoryId                      : Int
    let title, description, creationDate    : String
    let price                               : Double
    let imagesUrl                           : ImageUrl//[String:String] // ImageUrl
    let isUrgent                            : Bool
    
    /**
     List of all coding keys
     */
    enum CodingKeys: String, CodingKey
        {
        case id
        case title
        case description                   
        case price
        case categoryId                     = "category_id"
        case creationDate                   = "creation_date"
        case imagesUrl                      = "images_url"
        case isUrgent                       = "is_urgent"
        }
        
    

    } // end of extension --------------------------------------------------------------

//==============================================================================


