//
//  DecoderHandler.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation


/**
 Helper class to decode any Data into this Object representation
 */
class DecoderHandler
    {
    
    // MARK: - Public methods

	/**
	 Allows to decode JSON into any type of Object
	 */
    func decodeToObject<T : Decodable>
        (
        _ dynamicType: T.Type,
        inToDecode: Data
        ) ->  Result<T,Error>
        {
        return Result { try JSONDecoder().decode(T.self, from: inToDecode) }
        }
    
    } // end of extension --------------------------------------------------------------

//==============================================================================

