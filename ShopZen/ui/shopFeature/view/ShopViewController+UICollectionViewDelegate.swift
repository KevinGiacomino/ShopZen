//
//  ShopViewController+UICollectionViewDelegate.swift
//  ShopZen
//
//  Created by Kevin on 08/05/2022.
//

import UIKit

extension ShopViewController: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}
