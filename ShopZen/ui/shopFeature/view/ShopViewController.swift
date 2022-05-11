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
    
    // MARK: - Private variables
    

    var categoryBtns			: [UIButton] = [UIButton]()
    var mItems                  : [Item]?
    
    // MARK: - UI Widgets
	
	lazy public var categoryScrollView : UIScrollView =
		{
		let outScrollView = UIScrollView()
		outScrollView.translatesAutoresizingMaskIntoConstraints = false

		//outScrollView.isScrollEnabled = true
		//outScrollView.contentSize = CGSize(width: self.view.frame.width, height: scrollView.frame.size.height)
		return outScrollView
		}()

    /***/
    lazy public var nbOfItemsBarBtn : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        outBarButton.tintColor = .white
        //outBarButton.action = #selector(onFilterTapped)
       // outBarButton.title                 = "97 articles"
        return outBarButton
        }()
    
    /***/
    lazy public var nbOfItemsText : UILabel =
        {
        let outLabel = UILabel()
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
            
       // var vFilterImg = UIImage(named: "ic_filter")
       // outBarButton.setBackgroundImage(vFilterImg, for: .normal)
      //  outBarButton.image = vFilterImg

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


    /***/
    lazy public var categoryStackView : UIStackView =
        {
       let outStackView = UIStackView()
        outStackView.translatesAutoresizingMaskIntoConstraints = false
        outStackView.axis = .horizontal
        outStackView.alignment = .center
            outStackView.distribution = .equalSpacing
        outStackView.spacing = 10
        return outStackView
        }()

    lazy public var collectionFlowLayout : UICollectionViewFlowLayout =
		{
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
    

    
    // MARK: - Tapped methods
    
	/**
	 Called when user taps on a category item from the collection of category
	 */
	@objc func onCategoryTapped(sender: UIButton!)
        {
        print("Button tapped \(sender.tag)")
           // setBtnSelected( inBtn: sender)
       
        categoryBtns.forEach
			{
			$0.isSelected = false
			setBtnUnSelectedUI(inBtn: $0)
            }
        setBtnSelectedUI(inBtn: sender)
        viewModel.onCategoryTapped(inCatId: sender.tag)
        }

    // MARK: - From delegate (MVVM)
    
    /**
     See ShopViewDelegate#configureMainUI()
     */
    func configureMainUI()
        {
        view.backgroundColor                = ColorPalette.AppBgColor
            
		categoryScrollView.addSubview(categoryStackView)
            //view.addSubview(scrollView)
		view.addSubview(categoryScrollView,  anchors: [.leading(8), .trailing(-8), .top(16)])
          //  scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
           // scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
           // scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
		categoryScrollView.heightAnchor.constraint(equalToConstant: 50).isActive = true

            
		categoryStackView.leadingAnchor.constraint(equalTo: categoryScrollView.leadingAnchor).isActive = true
		categoryStackView.trailingAnchor.constraint(equalTo: categoryScrollView.trailingAnchor).isActive = true
		categoryStackView.topAnchor.constraint(equalTo: categoryScrollView.topAnchor).isActive = true
		categoryStackView.bottomAnchor.constraint(equalTo: categoryScrollView.bottomAnchor).isActive = true
		categoryStackView.widthAnchor.constraint(greaterThanOrEqualTo: categoryScrollView.widthAnchor).isActive = true

        }
    
	/**
	 See ShopViewDelegate#configureNavBar()
	 */
    func configureNavBar()
        {
        navigationItem                      .title = AppKeys.kShopTitle
            //view.addSubview(nbofItemLabel, anchors: [.leading(8), .top(16)])
        navigationItem.leftBarButtonItem    = nbOfItemsBarBtn
       // navigationItem.rightBarButtonItem   = filterBarButton
                /* let menuButtonImage = UIImage(named: "")
            let menuButton = UIBarButtonItem(title: "test", style: .plain, target: self, action: #selector(didTapMenuButton))
            menuButton.tintColor = .white
            navigationItem.rightBarButtonItem = menuButton*/
                // Adding header view
      //  view.addSubview(headerStackView, anchors: [.leading(24), .trailing(-24), .top(16)])

        }




    
    /***/
    private func setBtnSelectedUI( inBtn : UIButton )
        {
        inBtn.setTitleColor(.white, for: .normal)
        inBtn.backgroundColor = ColorPalette.AccentColor
        inBtn.isSelected = true
        // Avoid double taps
        inBtn.isEnabled = false
        }

    /***/
    private func setBtnUnSelectedUI( inBtn : UIButton )
        {
        inBtn.setTitleColor(.white, for: .normal)
        inBtn.backgroundColor = .clear
        inBtn.setTitleColor(.darkGray, for: .normal)
        inBtn.isEnabled = true

        }
    
    
    private func createCategoryBtn( inTitle : String ) -> UIButton
        {
        let outBtn = UIButton()
        outBtn.setTitleColor(.darkGray, for: .normal)
        outBtn.setTitle(inTitle, for: .normal)
        outBtn.backgroundColor = .clear
        outBtn.layer.cornerRadius = 10
        outBtn.layer.borderWidth = 1
        outBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 14)
        outBtn.sizeToFit()
        outBtn.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
		outBtn.addTarget(self, action: #selector(onCategoryTapped), for: .touchUpInside)
        //outBtn.showsTouchWhenHighlighted = true

       // button.titleEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        outBtn.layer.borderColor = ColorPalette.AccentColor.cgColor
        return outBtn
        }
    
   
    /**
     See ShopViewDelegate#configureCategoriesView()
     */
    func configureCategoriesView
        (
        inListOfCategory : Categories
        )
        {
            
        let vAllBtn = createCategoryBtn(inTitle: "Tout")
        setBtnSelectedUI(inBtn: vAllBtn)
        categoryStackView.addArrangedSubview(vAllBtn)
        categoryBtns.append(vAllBtn)
		
        for vCategory in inListOfCategory.listOfCategory.enumerated()
            {
            let vCatBtn = createCategoryBtn(inTitle: vCategory.element.name)
            vCatBtn.tag = vCategory.element.id
            categoryBtns.append(vCatBtn)

           // vCatBtn.action
            categoryStackView.addArrangedSubview(vCatBtn)
            }
        }

 
    /**
     See ShopViewDelegate#configureCollectionView()
     */
    func configureCollectionView()
        {
        view.addSubview(itemCollectionView)
       // itemCollectionView.topAnchor            .constraint(equalTo: nbOfItemsText.bottomAnchor).isActive = true
		itemCollectionView .topAnchor           .constraint(equalTo: categoryScrollView.bottomAnchor, constant: 16.0).isActive = true
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
        ZenLog.c("pushListOfItem")

        DispatchQueue.main.async
            {
            self.mItems = inListOfItem.listOfItem
           // self.itemCollectionView.scrollToItem(at: IndexPath(row: 1, section: 0),  at: .top,  animated: true)
            self.itemCollectionView.reloadData()
            }
        }
    
    /**
     See ShopViewDelegate#pushListOfItem()
     */
    func pushNbOfItems( inNbOfItems : String )
        {
        ZenLog.c("pushNbOfItems\(inNbOfItems)")
        nbOfItemsBarBtn.title = inNbOfItems
        }
        
	/**
	 See ShopViewDelegate#popError()
	 */
	func popError
		(
		inErrorMsg : String
		)
		{
        ZenLog.c("popError\(inErrorMsg)")

		}
		
	/**
	 See ShopViewDelegate#popError()
	 */
	func goToItemViewDetail( inVc : UIViewController )
		{
		ZenLog.c("goToItemViewDetail")
		self.present(inVc, animated: true, completion: nil)
		}

    
    /***/
    func displayWaitingAnimation()
        {
        
        }
        
        
	/***/
    func hideWaitingAnimation()
        {
        }
    
	/***/
    override func bindViewModelToView() -> ShopViewModel
        {
        return ViewModelFactory.shared.shopViewModel
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


