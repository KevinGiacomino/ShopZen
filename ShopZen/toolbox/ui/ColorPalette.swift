//
//  ColorPalette.swift
//  ShopZen
//
//  Created by Spirtech on 11/05/2022.
//

import Foundation
import UIKit


struct ColorPalette
	{
    /// Accent color with fallback
    static let AccentColor 	    = UIColor(named: "AccentColor")    ?? .systemBlue
    static let SecondaryColor   = UIColor(named: "SecondaryColor") ?? .systemOrange
    static let AppBgColor 	    = UIColor(named: "AppBgColor")     ?? .systemGray
    
	}
