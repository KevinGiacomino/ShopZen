//
//  ShopViewController+UICollectionViewDelegateFlowLayout.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import UIKit

/**
 Extension for ShopViewController
 Holds UICollectionViewDelegateFlowLayout
 */
extension ShopViewController: UICollectionViewDelegateFlowLayout
    {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
        {
        if let vTitle = items?[indexPath.row].title
            {

            let contentHorizontalSpaces = collectionFlowLayout.minimumInteritemSpacing
            + collectionFlowLayout.sectionInset.left
            + collectionFlowLayout.sectionInset.right
            let newCellWidth = (collectionView.bounds.width - contentHorizontalSpaces) / 2
            let newHeight = ItemCollectionViewCell.getProductHeightForWidth(props: vTitle, width: newCellWidth)
            return CGSize(width: newCellWidth, height: newHeight)
            }

        return CGSize(width: 0, height: 0)

        }

    } // end of class --------------------------------------------------------------

//==============================================================================



