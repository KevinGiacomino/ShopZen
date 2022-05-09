//
//  UIImageView+Extension.swift
//  ShopZen
//
//  Created by Kevin on 09/05/2022.
//

import UIKit

extension UIImageView
    {
    public func imageFromUrl( inUrlStr : String ) throws
        {
        if let url = URL(string: inUrlStr )
            {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                    
                DispatchQueue.main.async
                    {
                    print("SET URL FOR: \(inUrlStr)")
                    self.image = UIImage(data: data)
                    
                    }
                }
            task.resume()
            }
        else
            {
            throw "No excepted image"
            }
        }
    }
