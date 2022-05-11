//
//  ItemDetailViewModel.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
//

import Foundation

import Foundation
import Combine

/***/
class ItemDetailViewModel : BaseViewModel<ItemDetailDelegate>
    {
    
    // MARK: - Private variables
    
    public var item : Item?
    
    // MARK: - Public methods

    /***/
	override func onAttach()
		{
		if let vItem = item,
		   let vImgUrlStr = vItem.imagesUrl[AppKeys.kThumb],
			let vImgUrl = URL(string:vImgUrlStr),
			let vCatName	= vItem.categoryName
			{
			getDelegate().configureItemView(
				inImgURL	: vImgUrl,
				inIsUrgent	: vItem.isUrgent,
				inTitle		: vItem.title,
				inCatName	: vCatName,
				inDesc  	: vItem.description,
				inPrice 	: vItem.formattedPrice,
				inDate		: vItem.dateOfCreation.dateAndTimeFormat()
				)
			}
		else
			{
            // ----------------
            // An error happened, immediately close the view
            // ----------------
            getDelegate().closeThisView()
			}
		
		}
    
    /**
     User taps on the back button
     Close this view
     */
    public func onBackBtnTapped()
        {
        getDelegate().closeThisView()
        }
    
    /**
     User taps on the back button
     XXX
     */
    public func onShareBtnTapped()
        {
        
        }
        
    // MARK: - Private methods


    } // end of extension --------------------------------------------------------------

//==============================================================================



