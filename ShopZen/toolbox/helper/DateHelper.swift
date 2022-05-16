//
//  DateHelper.swift
//  ShopZen
//
//  Created by Kevin on 11/05/2022.
//

import Foundation

/**
 Date format helper class
 */
struct DateHelper
	{
	/// Web date format :
	static var webDateFormat : String
		{
		return  "yyyy-MM-dd'T'HH:mm:ssZ"
		}
	/// A clear format :
	static var clearyFormat : String
		{
		return  "d MMMM yyyy, HH:mm"
		}
		
	} // end of extension --------------------------------------------------------------

//==============================================================================

