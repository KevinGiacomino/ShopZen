//
//  ShopViewController+UICollectionViewDataSource.swift
//  ShopZen
//
//  Created by Kevin on 08/05/2022.
//

import UIKit

/**
 Extension for ShopViewController
 Holds the UICollectionViewDataSource
 */
extension ShopViewController: UICollectionViewDataSource
    {
    /***/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
        return items?.count ?? 0
        }
    /***/
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
        let outCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        // Ensure than an item exists at indexPath
        guard let vItem = items?[indexPath.row] else { return outCell }
        // Set image
        if let vImgUrlStr = vItem.imagesUrl[ AppStrings.kThumb ],
           let vImgUrl = URL(string: vImgUrlStr)
            {
            outCell.img.loadImageWithUrl( inUrl: vImgUrl)
            }
        else
            {
            outCell.img.image = UIImage(named: AppStrings.kDefaultImg )
            }
        // Set title
        outCell.title.text = vItem.title
        // Set price
        outCell.price.text = vItem.formattedPrice
        // Check for ugence
        outCell.urgentIconView.isHidden = !vItem.isUrgent
        // Set category name
        outCell.categoryName.text = vItem.categoryName
        return outCell
        }
    
    } // end of class --------------------------------------------------------------

//==============================================================================

