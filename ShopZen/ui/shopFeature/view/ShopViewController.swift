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
		outScrollView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
		
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
        ZenLog.d("Button tapped \(sender.tag)")
		// ---------------
		// First, unselected all buttons
		// ---------------
        categoryBtns.forEach
			{
			$0.isSelected = false
			setCatBtnUnSelectedUI(inBtn: $0)
            }
		// ---------------
		// Then select the tapped button
		// ---------------
        setCatBtnSelectedUI(inBtn: sender)
		// ---------------
		// Finally prevent the host
		// ---------------
        viewModel.onCategoryTapped(inCatId: sender.tag)
        }

    // MARK: - From delegate (MVVM)
    
    /**
     See ShopViewDelegate#configureMainUI()
     */
    func configureMainUI()
        {
        // Sets main background color
        view.backgroundColor                = ColorPalette.AppBgColor
		// Adding widget to view
		view.addSubview(categoryScrollView,  anchors: [.leading(8), .trailing(-8), .top(16)])
		categoryScrollView.heightAnchor.constraint(equalToConstant: 35).isActive = true
		// Sets default anchor
		// ----------------
		// Configure the categoryScrollView
		// ----------------
		categoryScrollView.addSubview(categoryStackView)
		// Sets height anchor
		//categoryScrollView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		// Sets leading anchor to categoryScrollView leading anchor
		categoryStackView.leadingAnchor.constraint(equalTo: categoryScrollView.leadingAnchor).isActive = true
		// Sets trailing anchor to categoryScrollView trailing anchor
		categoryStackView.trailingAnchor.constraint(equalTo: categoryScrollView.trailingAnchor).isActive = true
		// Sets top anchor to categoryScrollView top anchor
		categoryStackView.topAnchor.constraint(equalTo: categoryScrollView.topAnchor).isActive = true
		// Sets bottom anchor to categoryScrollView bottom anchor
		categoryStackView.bottomAnchor.constraint(equalTo: categoryScrollView.bottomAnchor).isActive = true
		// Sets width anchor
		categoryStackView.widthAnchor.constraint(greaterThanOrEqualTo: categoryScrollView.widthAnchor).isActive = true

        }
    
	/**
	 See ShopViewDelegate#configureNavBar()
	 */
    func configureNavBar()
        {
        navigationItem                      .title = AppStrings.kShopTitle
        navigationItem.leftBarButtonItem    = nbOfItemsBarBtn
        }
    
   
    /**
     See ShopViewDelegate#configureCategoriesView()
     */
    func configureCategoriesView
        (
        inListOfCategory : Categories
        )
        {
            
        let vAllBtn = createCatBtn(inTitle: "Tout")
        setCatBtnSelectedUI(inBtn: vAllBtn)
        categoryStackView.addArrangedSubview(vAllBtn)
        categoryBtns.append(vAllBtn)
		
        for vCategory in inListOfCategory.listOfCategory.enumerated()
            {
            let vCatBtn = createCatBtn(inTitle: vCategory.element.name)
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
        // Sets top anchor
		itemCollectionView .topAnchor           .constraint(equalTo: categoryScrollView.bottomAnchor, constant: 16.0).isActive = true
		// Sets leading anchor to view
        itemCollectionView.leadingAnchor        .constraint(equalTo: self.view.leadingAnchor).isActive = true
        // Sets trailing anchor to view
        itemCollectionView.trailingAnchor       .constraint(equalTo: self.view.trailingAnchor).isActive = true
        // Sets bottom anchor to view
        itemCollectionView.bottomAnchor         .constraint(equalTo: self.view.bottomAnchor).isActive = true
		// Sets background color to clear
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
        ZenLog.d("pushListOfItem")

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
        ZenLog.d("pushNbOfItems \(inNbOfItems)")
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
        ZenLog.d("popError\(inErrorMsg)")
        popDialog(inTitle: AppStrings.kErrorTitle, inMsg: AppStrings.kUnknownItem, inWithOkBtn: true)
		}
		
	/**
	 See ShopViewDelegate#popError()
	 */
	func goToItemViewDetail( inVc : UIViewController )
		{
		ZenLog.d("goToItemViewDetail")
		//self.navigationController?.pushViewController(inVc, animated: true)
		self.present(inVc, animated: true, completion: nil)
		}
    
    // MARK: - Methods from Base (View Model)
    
    /***/
    func displayWaitingAnimation() {}
        
        
	/***/
    func hideWaitingAnimation(){}
    
	/***/
    override func bindViewModelToView() -> ShopViewModel
        {
        return ViewModelFactory.shared.shopViewModel
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================

