//
//  BaseViewModel.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import Foundation

/****/
public class BaseViewModel< Delegate : BaseProtocol >
    {
        
    // MARK: - CLASS VARIABLES
    
    /// instance of the delegate. This variable is initialized once and deinit only when the app memory released
    private lazy var privDelegate : Delegate? = nil
    
    /// Retrieve the Delegate from outside of this class
    public lazy var viewModelDelegate : Delegate?  = { return privDelegate }()
        
    // MARK: - CONSTRUCTOR
    
    /**
     Main constructor
     */
    public init(){}
    
    /**
     Entry point of the Presenter.
     Should be overrided in each presenter classes.
     */
    public func onAttach(){}
    
    /**
     Main method to attach the delegate protocol
     
     - parameter inDelegate: instance of the delegate
     */
    func attachDelegate( _ inDelegate : Delegate )
        {
        ZenLog.d("attachDelegate \(  Delegate.self )")
        viewModelDelegate = inDelegate
        }
        
    } // end of class --------------------------------------------------------------

//==============================================================================

