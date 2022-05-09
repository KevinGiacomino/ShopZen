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
    let imagesUrl                           : [String:String] //ImageUrl//[String:String] // ImageUrl
    let isUrgent                            : Bool
    
    var categeryName                        : String?
    
    /***/
    lazy var formattedPrice : String =
        {
        var outPrice = ""
        outPrice = String(format: "$%.02f", price)
        return outPrice
        }()
    
    /***/
    lazy var dateOfCreation : Date =
        {
        let vFormatter          = DateFormatter()
        vFormatter              .dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return vFormatter       .date(from: creationDate)!
        }()
    
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


