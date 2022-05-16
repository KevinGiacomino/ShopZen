//
//  Date+Extension.swift
//  ShopZen
//
//  Created by Kevin on 11/05/2022.
//

import Foundation

/**
 Extension for Date
  
    - webDateFormat : Returns a formatted date using the web format "yyyy-MM-dd'T'HH:mm:ssZ"
    - dateAndTimeFormat : Returns a formatted date using the format "d MMMM yyyy, HH:mm"
 */
extension Date
	{
    
    /**
     Returns a formatted date using DateHelper.webDateFormat
     */
	func webDateFormat( format: String = DateHelper.webDateFormat ) -> String
		{
        let vFormatter = DateFormatter()
        vFormatter.dateStyle = .short
        vFormatter.dateFormat = format
        return vFormatter.string(from: self)
		}
    
    /**
     Returns a formatted date using DateHelper.clearyFormat
     */
    func dateAndTimeFormat(format: String = DateHelper.clearyFormat ) -> String
		{
        let vFormatter = DateFormatter()
        vFormatter.dateStyle = .full
        vFormatter.dateFormat = format
        vFormatter.timeZone = NSTimeZone.local
        return vFormatter.string(from: self)
		}
		
	} // end of extension --------------------------------------------------------------

//=============================================================================
	
