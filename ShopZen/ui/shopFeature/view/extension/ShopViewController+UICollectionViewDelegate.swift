//
//  ShopViewController+UICollectionViewDelegate.swift
//  ShopZen
//
//  Created by Kevin on 08/05/2022.
//

import UIKit

/**
 Extension for ShopViewController
 Handle tap on collection view cell
 */
extension ShopViewController: UICollectionViewDelegate
	{
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
		{
		ZenLog.d("User tapped on item \(indexPath.row)")
		let vItem 	= mItems?[indexPath.row]
				ZenLog.d("vItemId : \(vItem?.title)")

        viewModel.onItemTapped( inItemId: vItem?.id ?? -1 )
		}
	}
