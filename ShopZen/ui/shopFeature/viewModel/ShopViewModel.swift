//
//  ShopViewModel.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
class ShopViewModel : BaseViewModel<ShopDelegate>
    {
    var networkService : NetworkService?
    
    private(set) var listOfItems : [Item]!
        {
        didSet
            {
            print("listOfItems set HELLO")
            //self.pushDummyToViewContoller()
            //getDelegate().updateListOfDummy(inDummyData: dummyObservable)
            }
        }

    init
        (
        inNetworkService : NetworkService
        )
        {
        networkService   = inNetworkService
        }
    
    
    override func onAttach()
        {
        print("HELLO VIEW MODEL")
        getDelegate().initializeUI()
        callListOfItems()
        
        }
    
    private func callListOfItems()
        {
        guard let vNetworkService = networkService else { return }
        do
            {
            try vNetworkService .fetchListOfItems { (inData) in self.listOfItems = inData }
            }
        catch
            {
            print("ERROR: \(error.localizedDescription)")
            }
    
            
        }
    
    
    } // end of class --------------------------------------------------------------

//==============================================================================

 
