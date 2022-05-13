//
//  BaseViewController.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

import UIKit


/**
 Parent class of each ViewController of your Application
 
 This class use the viewDidLoad of the UIViewController to create presenter and attach delegate
 
 So our application should call super.viewDidLoad()
 
 This class provide an abstract method that should be overrided by the ViewController:
 
		- bindViewModelToView() : Permits to bind the view model to the view
	
 Also the class offers the following variable:
 
		- viewModel 	: Easily retrieve the current view model of our View
 */
public class BaseViewController<Delegate, ViewModel : BaseViewModel<Delegate> > : UIViewController
    {

    private lazy var privViewModel  : BaseViewModel<Delegate>?      = nil
    private lazy var delegate       : Delegate?                     = nil
 
    /**
     Shared view model
     */
    public lazy var viewModel : ViewModel  =
        {
        if( privViewModel == nil )
            {
            privViewModel = bindViewModelToView()
            }
        return privViewModel as! ViewModel
        }()
    
        
    
    /***/
    public override func viewDidLoad()
        {
        // ---------------------
        // First bind the view model if no longer exists:
        // ---------------------
        if ( privViewModel == nil )
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
            viewModel.attachDelegate( vDelegate )
            }
        viewModel.onAttach()
        
        }
        
       
	/**
	 Allows to bind the view model to view
	 */
    func bindViewModelToView() -> ViewModel
        {
        preconditionFailure("This method must be overriden")
        }
        
    } // end of class --------------------------------------------------------------

//==============================================================================

