//
//  Item.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/**
 Class representing an Item
 */
struct Item : Decodable
    {
    
    // MARK: - Properties

    let id, categoryId                      : Int
    let title, description, creationDate    : String
    let price                               : Double
    let imagesUrl                           : [String:String] //ImageUrl//[String:String] // ImageUrl
    let isUrgent                            : Bool
    
    var categoryName                        : String?
    
	/***/
	var formattedPrice: String
		{
		var outPrice = ""
		outPrice = String(format: "%.0f €", price)
		return outPrice
		}
    
    
    /***/
	var dateOfCreation : Date
        {
        let vFormatter          = DateFormatter()
        vFormatter              .dateFormat = DateHelper.webDateFormat
        return vFormatter       .date(from: creationDate)!
        }
       
    // MARK: - Coding keys

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


