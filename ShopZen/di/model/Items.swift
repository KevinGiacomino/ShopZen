//
//  Items.swift
//  ShopZen
//
//  Created by Kevin on 09/05/2022.
//

import Foundation

class Items : NSObject
    {
    var listOfItem : [Item]
    
    
    init( inListOfItem : [Item] )
        {
        // TODO : REVOIR CE FILTRE,
        // SI URGENT > TRIER LES URGENT PAR DATE
        self.listOfItem = inListOfItem.sorted { (lhs, rhs) in
            var vLhs = lhs
            var vRhs = rhs
            // First if item is urgent sort it
            if vLhs.isUrgent == true { // <1>
                  return vLhs.isUrgent
                }
                
            return vLhs.dateOfCreation > vRhs.dateOfCreation// <2>
            }
        }
    
    
    
    }
