//
//  ShopViewController+UICollectionViewDelegateFlowLayout.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import UIKit

/**

 */
extension ShopViewController: UICollectionViewDelegateFlowLayout
    {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
        {
        if let vTitle = mItems?[indexPath.row].title
            {
            if UIDevice.current.orientation.isLandscape
                {
                let contentHorizontalSpaces = collectionFlowLayout.minimumInteritemSpacing
                + collectionFlowLayout.sectionInset.left
                + collectionFlowLayout.sectionInset.right
  
                let newCellWidth = (collectionView.bounds.width - contentHorizontalSpaces) / 3
                
                let newHeight = ItemCollectionViewCell.getProductHeightForWidth(props: vTitle, width: newCellWidth)
                //let newHeight = 250.0
                // TODO: CHECK POUR DYNAMISER CA
                return CGSize(width: newCellWidth, height: newHeight)
                /*let cellWidth =  (view.frame.size.width - 50) / 2

                return CGSize(width: (cellWidth-30)/2, height: (cellWidth-30)/2)*/
                }
            else
                {
                let contentHorizontalSpaces = collectionFlowLayout.minimumInteritemSpacing
                + collectionFlowLayout.sectionInset.left
                + collectionFlowLayout.sectionInset.right
                let newCellWidth = (collectionView.bounds.width - contentHorizontalSpaces) / 2
                let newHeight = ItemCollectionViewCell.getProductHeightForWidth(props: vTitle, width: newCellWidth)
                

                //let newHeight = 250.0
                return CGSize(width: newCellWidth, height: newHeight)
                }

            }

        return CGSize(width: 0, height: 0)

        }

    
    }
