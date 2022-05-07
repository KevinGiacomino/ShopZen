//
//  BaseViewController.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

import UIKit

public class BaseViewController<Delegate, ViewModel : BaseViewModel<Delegate> > : UIViewController
    {

    private lazy var viewModel : BaseViewModel<Delegate>?      = nil
    private lazy var delegate  : Delegate?                     = nil
 
    
    public override func viewDidLoad()
        {
        // ---------------------
        // First bind the view model if no longer exists:
        // ---------------------
        if ( viewModel == nil )
            {
            viewModel = bindViewModelToView()
            }
        // ---------------------
        // Next attach the delegate if no longer exist too:
        // ---------------------
        if delegate == nil,
           let vDelegate = self as? Delegate
            {
            delegate = vDelegate
            getViewModel().attachDelegate( vDelegate )
            }
        getViewModel().onAttach()
        
        }
        
        
    public func getViewModel() -> ViewModel
        {
        if( viewModel == nil )
            {
            viewModel = bindViewModelToView()
            }
        return viewModel as! ViewModel
        }
        
        
    func bindViewModelToView() -> ViewModel
        {
        preconditionFailure("This method must be overriden")
        }
        
    } // end of class --------------------------------------------------------------

//==============================================================================

