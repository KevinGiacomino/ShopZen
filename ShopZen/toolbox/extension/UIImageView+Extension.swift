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
        /*if let vUrl = URL(string: inUrlStr )
            {
                    
            let vSubscription =
                URLSession.shared
                   .dataTaskPublisher(for: vUrl)
                   .map { UIImage(data: $0.data) }
                   .print()
            
                   .replaceError(with: UIImage(named: AppKeys.kDefaultImg ))
                   //.receive(on: DispatchQueue.main)
                  // .eraseToAnyPublisher()
                   .assign(to: \.image, on: self)
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 1))

                    
            }*/
            
        if let url = URL(string: inUrlStr )
            {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else
                    {
                    print("error:::")
                    return
                    
                    }
                    
                DispatchQueue.main.async
                    {
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
