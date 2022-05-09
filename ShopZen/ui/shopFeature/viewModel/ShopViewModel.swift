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
    
    /***/
    private(set) var listOfCategory : [Category]!
        {
        didSet
            {
            print("listOfCategory set HELLO")
            //print("LIST OF CATEGORY : \(listOfCategory)")
            
            }
        }
    /***/
    private(set) var listOfItems : Items!
        {
        didSet
            {
            print("listOfItems set HELLO")
                print("LIST OF CATEGORY : \(listOfCategory)")
        
            getDelegate().pushListOfItems(inListOfItems: listOfItems )
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
       // defer { callListOfItems() }
        //callListOfCategories()
        
        }

    /***/
    /*private func callListOfCategories()
        {
        guard let vNetworkService = networkService else { return }
        do
            {
            try vNetworkService .fetchListOfCategory { (inData) in self.listOfCategory = inData }
            }
        catch
            {
            print("ERROR: \(error.localizedDescription)")
            }
    
            
        }*/
    
    
    /***/
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

 
