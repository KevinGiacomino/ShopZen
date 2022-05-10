//
//  ShopViewController.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import UIKit



/**
 Main view
 This class is responsible to manages the UI of this view.
 It displays a list of Items
 */
class ShopViewController        : BaseViewController<ShopDelegate, ShopViewModel>,
    ShopDelegate
    {
    
    
    var mItems                  : [Item]?
    
    // MARK: - UI Variables


    /***/
    lazy public var currentCatBtn : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        outBarButton.tintColor = .white
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
    
    // MARK: - Tapped methods
    
    	    
    @objc func onFilterTapped()
        {
        print("onFilterTapped")
        }

    // MARK: - From delegate (MVVM)
    
    /**
     See ShopViewDelegate#configureMainUI()
     */
    func configureMainUI()
        {
        view.backgroundColor                = UIColor(named: "AppBgColor")
        }
    
	/**
	 See ShopViewDelegate#configureNavBar()
	 */
    func configureNavBar()
        {
        navigationItem                      .title = "Shop"
            //view.addSubview(nbofItemLabel, anchors: [.leading(8), .top(16)])
        currentCatBtn.title                 = "All categories"
        navigationItem.leftBarButtonItem    = currentCatBtn
        navigationItem.rightBarButtonItem   = filterBarButton

                // Adding header view
      //  view.addSubview(headerStackView, anchors: [.leading(24), .trailing(-24), .top(16)])

        }
        
    /**
     See ShopViewDelegate#configureInfoView()
     */
    func configureInfoView()
        {
        nbOfItemsText.text                  = "97 items"
        view.addSubview(nbOfItemsText       , anchors: [.leading(16), .trailing(-16), .top(16)])
        }
    /**
     See ShopViewDelegate#configureCollectionView()
     */
    func configureCollectionView()
        {
        view.addSubview(itemCollectionView)
        itemCollectionView.topAnchor            .constraint(equalTo: nbOfItemsText.bottomAnchor).isActive = true
        itemCollectionView.leadingAnchor        .constraint(equalTo: self.view.leadingAnchor).isActive = true
        itemCollectionView.trailingAnchor       .constraint(equalTo: self.view.trailingAnchor).isActive = true
        itemCollectionView.bottomAnchor         .constraint(equalTo: self.view.bottomAnchor).isActive = true
        itemCollectionView                      .backgroundColor  = .clear
        }


    

    /**
	 See ShopViewDelegate#pushListOfItem()
	 */
    func pushListOfItem
		(
		inListOfItem : ItemsWithCategory
		)
        {
        DispatchQueue.main.async
            {
            self.mItems = inListOfItem.listOfItem
            self.itemCollectionView.reloadData()
            }
        }
        
	/**
	 See ShopViewDelegate#popError()
	 */
	func popError
		(
		inErrorMsg : String
		)
		{
		
		}
    
    
    func displayWaitingAnimation()
        {
        
        }
    
    func hideWaitingAnimation()
        {
        }
    
        
    override func bindViewModelToView() -> ShopViewModel
        {
        //return ViewModelFactory.shared().getShopViewModel()
        return ViewModelFactory.shared().shopViewModel
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


