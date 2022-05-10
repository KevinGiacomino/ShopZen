//
//  ZenLog.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
//

import Foundation
import os

/**
 Logger class
 It permits to disable log when app is released
 
	 - c() : allows to print normal
	 - x() : allows to print error or exception
 */
 class ZenLog
	{
             
    // MARK: - CLASS VARIABLES
	
    static var kForceLog = false
    
        
    // MARK: - PUBLIC METHODS:
	
    /**
	 E.g:     D.c("test print")
		>>> test print

	 E.g2:
	 let myvar   = 100
	 D.c("test print \(myvariable)")
		>>> test print 100
	 
		- parameter inLog	: The log to display
     */
    public static func d
		(
		_ inLog				: String
		)
        {
        if kForceLog
            {
            os_log("%s", inLog)
            }
        else
            {
            #if DEBUG
            os_log("%s", inLog)
            #endif
            }
        }
    

	/**
	 E.g:     D.c("test print", "test print 2")
		 >>> test print
		 >>> test print 2

	 E.g2:
	 let myvar   = 100
	 let myvar2  = 101
	 D.c("test print \(myvar)", "test print 2 \(myvar2)")
		>>> test print 100
		 >>> test print 2 101
		 
		
		- parameter inLogs	: A list of log to display
	 */
    public static func c
		(
		_ inLogs			: String...
		)
        {
        if kForceLog
            {
            for vLog in inLogs
                {
                os_log("%s", vLog)
                }
            }
        else
            {
            #if DEBUG
            for vLog in inLogs
                {
                os_log("%s", vLog)
                }
            #endif
            }
   
        }
    
    /**
	 Error logs
		
		E.g:     D.x("test print", "test print 2")
		 >>> ‼️ test print 2

	 
		- parameter inLog	: The log to display
     */
    public static func x
		(
		_ inLog 			: String
		)
        {
		#if DEBUG
        os_log("‼️: %s", inLog)
		#endif
        }
	} // end of class --------------------------------------------------------------

//==============================================================================


 
 
