//
//  ShopViewController.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import UIKit

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
                        print("=============================LANDSCAPE=============================")
                print("columnLayout.minimumInteritemSpacing : \(collectionFlowLayout.minimumInteritemSpacing)")
                print("columnLayout.sectionInset.left : \(collectionFlowLayout.sectionInset.left)")
                print("columnLayout.sectionInset.right : \(collectionFlowLayout.sectionInset.right)")
                let contentHorizontalSpaces = collectionFlowLayout.minimumInteritemSpacing
                + collectionFlowLayout.sectionInset.left
                + collectionFlowLayout.sectionInset.right
                print("collectionView.bounds.width: \(collectionView.bounds.width  - contentHorizontalSpaces)")
                let newCellWidth = (collectionView.bounds.width - contentHorizontalSpaces) / 4
                print("newCellWidth : \(newCellWidth)")
                print("==================================")
                
                let newHeight = ItemCollectionViewCell.getProductHeightForWidth(props: vTitle, width: newCellWidth)
                //let newHeight = 250.0
                // TODO: CHECK POUR DYNAMISER CA
                return CGSize(width: 150.0, height: newHeight)
                /*let cellWidth =  (view.frame.size.width - 50) / 2

                return CGSize(width: (cellWidth-30)/2, height: (cellWidth-30)/2)*/
                }
            else
                {
                print("=============================PORTRAIT=============================")
                print("columnLayout.minimumInteritemSpacing : \(collectionFlowLayout.minimumInteritemSpacing)")
                print("columnLayout.sectionInset.left : \(collectionFlowLayout.sectionInset.left)")
                print("columnLayout.sectionInset.right : \(collectionFlowLayout.sectionInset.right)")

                let contentHorizontalSpaces = collectionFlowLayout.minimumInteritemSpacing
                + collectionFlowLayout.sectionInset.left
                + collectionFlowLayout.sectionInset.right
                let newCellWidth = (collectionView.bounds.width - contentHorizontalSpaces) / 2
                let newHeight = ItemCollectionViewCell.getProductHeightForWidth(props: vTitle, width: newCellWidth)
                        print("newCellWidth : \(newCellWidth)")
                            print("collectionView.bounds.width: \(collectionView.bounds.width  - contentHorizontalSpaces)")
                
                print("==================================")

                //let newHeight = 250.0
                return CGSize(width: newCellWidth, height: newHeight)
                }

            }

        return CGSize(width: 0, height: 0)

        }

    
    }




/**
 Main view
 This class is responsible to manages the UI of this view.
 It displays a list of Items
 */
class ShopViewController        : BaseViewController<ShopDelegate, ShopViewModel>,
    ShopDelegate
    {
    
    
    var mItems                  : [Item]?
    
    /*let items = [
       "Status homme noir assis",
       "Lorem ipsum dolor sit amet, consectetur.",
       "Lorem ipsum dolor sit amet.",
       "Lorem ipsum dolor sit amet, consectetur.",
       "Lorem ipsum dolor sit amet, consectetur adipiscing.",
       "Lorem ipsum.",
       "Lorem ipsum dolor sit amet.",
       "Lorem ipsum dolor sit.",
       "Lorem ipsum dolor sit amet, consectetur adipiscing.",
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
       "Lorem ipsum dolor sit amet, consectetur."
   ]*/
    

    /***/
    lazy public var currentCatBtn : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        // outBarButton.title = "97 items"
        outBarButton.tintColor = .white
      
        //outBarButton.isEnabled = false
        // outBarButton.action =
        return outBarButton
        }()
    
    /***/
    lazy public var nbOfItemsText : UILabel =
        {
        let outLabel = UILabel()
        outLabel.textColor = .black
        let italicFont = UIFont.italicSystemFont(ofSize:18)
        outLabel.font = italicFont
        return outLabel
        }()
    
    /***/
    lazy public var nbOfItemsBarButton : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
       // outBarButton.title = "97 items"
        outBarButton.tintColor = .white
        
        //outBarButton.isEnabled = false
           // outBarButton.action =
        return outBarButton
        }()
    
    /***/
    lazy public var filterBarButton : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        outBarButton.title = "Filter"
        outBarButton.tintColor = .white
            // outBarButton.action =
            
        var vFilterImg = UIImage(named: "ic_filter")
       // outBarButton.setBackgroundImage(vFilterImg, for: .normal)
        outBarButton.image = vFilterImg
        outBarButton.image?.withRenderingMode(.alwaysOriginal)
        return outBarButton
        }()
     
    /**
     Number of items label
     */
    lazy public var nbofItemLabel: UILabel =
        {
        let outLabel = UILabel()
        outLabel.textColor = UIColor.black
        return outLabel
        }()
    
    /**
     */
    /*lazy public var filterIcon: UIImageView =
        {
        let outImg = UIImageView()
            
        outImg.heightAnchor.constraint(equalToConstant: CGFloat(24)).isActive = true
        outImg.widthAnchor.constraint(equalToConstant: CGFloat(24)).isActive = true
        outImg.clipsToBounds = true
        outImg.contentMode = .scaleAspectFit
            
        outImg.image = UIImage(named: "ic_filter")
        outImg.translatesAutoresizingMaskIntoConstraints = false
        return outImg
        }()*/
    
    /**
     */
    lazy public var filterLabel: UIButton =
        {
        let imageSize:CGSize    = CGSize(width: 20, height: 20)

        let outBtn              = UIButton(type: UIButton.ButtonType.custom )
           // outBtn.frame = CGRect(x: 200, y: 200, width: 60, height: 60)
        outBtn  .setImage(UIImage(named: "ic_filter"), for: .normal)
        outBtn  .imageView?.contentMode = .scaleAspectFit
            outBtn.imageEdgeInsets = UIEdgeInsets(top: 48.0, left: 0.0, bottom: 48.0, right: 50.0)
       // outBtn  .imageEdgeInsets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)

        outBtn.setTitle( "FILTER", for: .normal )
        outBtn.setTitleColor( .black, for: .normal)
        outBtn.translatesAutoresizingMaskIntoConstraints = false
            outBtn.addTarget(self, action: #selector(onFilterTapped), for: .touchUpInside)

        return outBtn
        }()
    
    /***/
    lazy public var headerStackView : UIStackView =
        {
        let outStackView = UIStackView(arrangedSubviews: [nbofItemLabel, filterLabel])
        outStackView.translatesAutoresizingMaskIntoConstraints = false

        outStackView.axis = .horizontal
            outStackView.alignment = .center
        outStackView.distribution = .equalCentering
        outStackView.spacing = 0
        return outStackView
        }()

    lazy public var collectionFlowLayout : UICollectionViewFlowLayout = {
        let outLayout = UICollectionViewFlowLayout()
        outLayout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        outLayout.minimumInteritemSpacing = 10
        outLayout.minimumLineSpacing = 10
        outLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        return outLayout
        
        }()
    
    /***/
    lazy public var itemCollectionView : UICollectionView =
        {
        let outCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionFlowLayout)
        outCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCell")
        outCollectionView.backgroundColor = UIColor.white
        outCollectionView.translatesAutoresizingMaskIntoConstraints = false

        outCollectionView.dataSource = self
        outCollectionView.delegate = self
        return outCollectionView
        }()
    
    
    
    /**
     
     */
    /*lazy public var filterStackView : UIStackView =
        {
        let outStackView = UIStackView(arrangedSubviews: [filterIcon, filterLabel])
        outStackView.axis = .horizontal
            outStackView.alignment = .center
        outStackView.distribution = .fillProportionally
        outStackView.spacing = 0
            
        return outStackView
        }()*/
    

    func initializeUI()
        {
        navigationItem                      .title = "Shop"
        view.backgroundColor                = .yellow
        //view.addSubview(nbofItemLabel, anchors: [.leading(8), .top(16)])
        currentCatBtn.title                 = "All categories"
        navigationItem.leftBarButtonItem    = currentCatBtn
        navigationItem.rightBarButtonItem   =  filterBarButton
        view.backgroundColor                = UIColor(named: "AppBgColor")
        nbOfItemsText.text                  = "97 items"
        
        itemCollectionView                  .backgroundColor  = .clear
        // Adding header view
      //  view.addSubview(headerStackView, anchors: [.leading(24), .trailing(-24), .top(16)])
        view.addSubview(nbOfItemsText       , anchors: [.leading(16), .trailing(-16), .top(16)])
            
        view.addSubview(itemCollectionView)
            
        itemCollectionView.topAnchor            .constraint(equalTo: nbOfItemsText.bottomAnchor).isActive = true
        itemCollectionView.leadingAnchor        .constraint(equalTo: self.view.leadingAnchor).isActive = true
        itemCollectionView.trailingAnchor       .constraint(equalTo: self.view.trailingAnchor).isActive = true
        itemCollectionView.bottomAnchor         .constraint(equalTo: self.view.bottomAnchor).isActive = true
        /*itemCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0).isActive = true
        itemCollectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 20).isActive = true
        itemCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0).isActive = true
        itemCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0).isActive = true*/

         /*   NSLayoutConstraint.activate([
                itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
                itemCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
                itemCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
                itemCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
            ])*/
        // Adding header view
        //view.addSubview(headerStackView, anchors: [.leading(24), .trailing(-24), .top(16)])
        //view.addSubview(itemCollectionView, anchors: [.leading(24), .trailing(-24), .top(80)])
        // Adding collection view :
        /*let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 40, height: 40)
       
        
        let view = UIView()
           view.backgroundColor = .white
           
           myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
           myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
           myCollectionView?.backgroundColor = UIColor.white
           
           myCollectionView?.dataSource = self
           myCollectionView?.delegate = self*/

           
           //self.view = view
        }
    
    @objc func onFilterTapped()
        {
       /* var alertView = UIAlertView()
        alertView.addButton(withTitle: "Ok")
        alertView.title = "title"
        alertView.message = "message"
        alertView.show()*/
        print("onFilterTapped")
        }
    
    /***/
    func pushListOfItems( inListOfItems : Items )
        {
        DispatchQueue.main.async
            {
           //self.mItems = inListOfItems.listOfItem.sort { $0.isUrgent == $1.isUrgent ? $0.getCreationDate() < $1.firstName : $0.getCreationDate() > $1.getCreationDate()  }


            self.mItems = inListOfItems.listOfItem
            self.itemCollectionView.reloadData()
            
            }
        }
    
    func displayWaitingAnimation()
        {
        
        }
    
    func hideWaitingAnimation()
        {
        }
    
        
    override func bindViewModelToView() -> ShopViewModel
        {
        return ViewModelFactory.shared().getShopViewModel()
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================
/*
extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9 // How many cells to display
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }
}*/


