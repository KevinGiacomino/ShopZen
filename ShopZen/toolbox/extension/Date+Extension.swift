//
//  Date+Extension.swift
//  ShopZen
//
//  Created by Kevin on 11/05/2022.
//

import Foundation

/**

 */
extension Date
	{
	/***/
	func webDateFormat( format: String = DateHelper.webDateFormat ) -> String
		{
	   let vFormatter = DateFormatter()
        vFormatter.dateStyle = .short
        vFormatter.dateFormat = format
        return vFormatter.string(from: self)
		}
    
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
	
