//
//  ShopViewController+UICollectionViewDataSource.swift
//  ShopZen
//
//  Created by Kevin on 08/05/2022.
//

import UIKit

/***/
extension ShopViewController: UICollectionViewDataSource
    {
    /***/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
        return mItems?.count ?? 0
        }
    /***/
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
        let outCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCollectionViewCell
        // Ensure than an item exists at indexPath
        guard var vItem = mItems?[indexPath.row] else { return outCell }
        // Set image
        if let vImgUrl = vItem.imagesUrl[ AppKeys.kThumb ]
            {
            do
                {
                try outCell.img.imageFromUrl(inUrlStr: vImgUrl)
                }
            catch
                {
                outCell.img.image = UIImage(named: AppKeys.kDefaultImg )
                }
            }
        else
            {
            outCell.img.image = UIImage(named: AppKeys.kDefaultImg )
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
    }

/*
extension ShopViewController: UICollectionViewDataSource
    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
        {
        return 9
        //return items.count // How many cells to display
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
        {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemCollectionViewCell
        //cell.label.text = items[indexPath.row]
        return cell
        }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransition")
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    }
*/
