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
    private lazy var delegate : Delegate? = nil
    
        
    // MARK: - CONSTRUCTOR
    
    /**
     Main constructor
     */
    public init(){}
    
    /**
     Entry point of the Presenter.
     Should be overrided in each presenter classes.
     */
    open func onAttach(){}
    
    /**
     Main method to attach the delegate protocol
     
     - parameter inDelegate: instance of the delegate
     */
    func attachDelegate( _ inDelegate : Delegate )
        {
        ZenLog.d("attachDelegate \(  Delegate.self )")
        delegate = inDelegate
        }
        
    
    /**
     Allows to retrieve the Delegate from outside of this class
     
     - Returns: The delegate attached to this presenter
     */
    open func getDelegate() -> Delegate
        {
        return delegate!
        }
    
    } // end of class --------------------------------------------------------------

//==============================================================================

