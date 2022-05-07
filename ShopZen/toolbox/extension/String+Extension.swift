//
//  String+Extension.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

extension String: LocalizedError
    {
    public var errorDescription: String? { return self }
    }
