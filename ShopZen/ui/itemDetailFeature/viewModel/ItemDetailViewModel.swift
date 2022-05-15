//
//  ItemDetailViewModel.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import Foundation

import Foundation
import Combine

/**
 View model for Item Detail Feature
 Holds the logic of the ItemDetailViewController
 */
class ItemDetailViewModel : BaseViewModel<ItemDetailDelegate>
    {
    
    // MARK: - Class variables
    
    // Should be completed with the current item tapped from the previous screen
    public var item                 : Item?
    // Critical parameter of Item object, should be checked
    private var bgImgUrl            : URL!
    // Critical parameter of Item object, should be checked
    private var categoryName        : String!
    // Ensure that the provided item is compliant and could be display in the view
    private(set) var isItemCompliant : Bool!
        {
        didSet
            {
            if( isItemCompliant )
                {
                // ----------------
                // Item is compliant, display it
                // ----------------
                viewModelDelegate?.configureItemView(
                    inImgURL    : bgImgUrl,
                    inIsUrgent  : item!.isUrgent,
                    inTitle     : item!.title,
                    inCatName   : categoryName,
                    inDesc      : item!.description,
                    inPrice     : item!.formattedPrice,
                    inDate      : item!.dateOfCreation.dateAndTimeFormat()
                    )
                }
            else
                {
                // ----------------
                // Item is not compliant, immediately close the view
                // ----------------
                viewModelDelegate?.closeThisView()
                }
            }
        }
    
    
    // MARK: - Public methods

    /***/
	override func onAttach()
		{
       // parseItemDataAndDisplayIt()
        checkIfItemIsCompliant()
		}
    
    /**
     Check if item is compliant to correctly display it in the view.
     
     --------------
     CRITICAL PART:
     Item should holds :
        - A correct background image URL
        - A category name
     */
    func checkIfItemIsCompliant()
        {
        if let vItem = item,
           let vImgUrlStr = vItem.imagesUrl[AppStrings.kThumb],
            vImgUrlStr.isValidURL,
            let vImgUrl = URL(string:vImgUrlStr),
            let vCatName    = vItem.categoryName
            {
            // TODO: check if url is correct
            bgImgUrl        = vImgUrl
            categoryName    = vCatName
            isItemCompliant = true
            }
        else
            {
            isItemCompliant = false
            }
        }
    
    /**
     User taps on the back button
     Close this view
     */
    public func onBackBtnTapped()
        {
        viewModelDelegate?.closeThisView()
        }
    
    /**
     User taps on the back button
     ❌ UI ONLY : Method not implemented for this demo
     */
    public func onShareBtnTapped()
        {
        viewModelDelegate?.shareItemToSocialNetwork()
        }
        
	/**
	 User taps on the contact button
	 ❌ UI ONLY : Method not implemented for this demo
	 */
	public func onContactBtnTapped()
		{
        viewModelDelegate?.openMailToContactSeller()
		}
        
    // MARK: - Private methods


    } // end of extension --------------------------------------------------------------

//==============================================================================



