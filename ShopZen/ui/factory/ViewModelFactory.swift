//
//  ViewModelFactory.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/***/
class ViewModelFactory
    {
    
    private var networkService  : NetworkService?
    private let shopViewModel   : ShopViewModel?
    private static var instance : ViewModelFactory?
    
    
    init()
        {
        networkService = NetworkService()
        shopViewModel = ShopViewModel(inNetworkService: networkService! )
        }
    
    public static func shared() -> ViewModelFactory
        {
        if let vInstance = instance
            {
            instance = ViewModelFactory()
            return vInstance
            }
        return ViewModelFactory()
        }
    
    public func getShopViewModel() -> ShopViewModel
        {
        return shopViewModel!
        }
    }
