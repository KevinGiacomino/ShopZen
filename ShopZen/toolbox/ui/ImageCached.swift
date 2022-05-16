//
//  ImageLoader.swift
//  ShopZen
//
//  Created by Kevin on 11/05/2022.
//

import UIKit

/**
 Sub class of UIImageView Widget
 Allows to cache image using NSCache to improve loading performance
 */
class ImageCached: UIImageView
	{

    // MARK: - Private methods
    private let imageCache 			= NSCache<AnyObject, AnyObject>()
    private var imageURL			: URL?
    private let activityIndicator 	= UIActivityIndicatorView()

    // MARK: - Private methods
    
    /**
     Loads an image using a web URL and cache it to easily reuse it later
     
      - parameter inUrl : 	The URL of the image to load
	 */
    func loadImageWithUrl
		(
		inUrl	: URL
		)
		{
        // Set up indicator
        activityIndicator	.color = .darkGray
		// Adding indicator to subview
        addSubview			( activityIndicator )
        // Setup constraints
		configureConstraints( )
		// Set image url
        imageURL 	= inUrl
		// Reset by default
        image 		= nil
        // Starting indicator animation
        activityIndicator.startAnimating()
		// -------------------
        // Retrieves image if already available in cache
        // -------------------
        if let vImageFromCache = imageCache.object(forKey: inUrl as AnyObject) as? UIImage
			{
            self.image = vImageFromCache
            activityIndicator.stopAnimating()
            return
			}
		// -------------------
        // image is not available from cache
        // So retrieving it from URL
        // -------------------
        URLSession.shared.dataTask(with: inUrl, completionHandler: { (data, response, error) in
			
			// -------------------
			// Error handling :
			// -------------------
            if error != nil
				{
				//-------------------
				// An error happened, stop the animation
				// -------------------
				ZenLog.x( error?.localizedDescription ?? "Error from image loading" )
                DispatchQueue.main.async(execute: { self.activityIndicator.stopAnimating() })
                return
				}
			//-------------------
			// No error, continue :
			// -------------------
            DispatchQueue.main.async(execute:
				{
				// --------------
				// Getting data and displays image + cache it
				// --------------
                if let vData = data, let vImageToCache = UIImage(data: vData)
					{
					// Set image to image view
                    if self.imageURL == inUrl { self.image = vImageToCache }
                    // Adding image to cache management
                    self.imageCache.setObject(vImageToCache, forKey: inUrl as AnyObject)
					}
				// Finish indicator animation
                self.activityIndicator.stopAnimating()
				})
			}).resume()
		}
		
	/**
	 Configure all constraints for widgets in this view
	 */
	private func configureConstraints()
		{
		activityIndicator	.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator	.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator	.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		}
    
    } // end of class --------------------------------------------------------------

//==============================================================================
	
