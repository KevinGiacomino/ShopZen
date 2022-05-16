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

    /// Will contains the list of category button for the filter feature
    var categoryBtns			: [UIButton] = [UIButton]()
    /// Will contains the list of received items from API
    var items                   : [Item]?
    
    // MARK: - UI Widgets

    /***/
	lazy var categoryScrollView : UIScrollView =
		{
		let outScrollView = UIScrollView()
		outScrollView.translatesAutoresizingMaskIntoConstraints = false
		outScrollView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        return outScrollView
		}()

    /***/
    lazy var nbOfItemsBarBtn : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        outBarButton.tintColor = .white
        return outBarButton
        }()
    
    /***/
    lazy var nbOfItemsText : UILabel =
        {
        let outLabel = UILabel()
        let italicFont = UIFont.italicSystemFont(ofSize:18)
        outLabel.font = italicFont
        return outLabel
        }()
    
    /***/
    lazy var nbOfItemsBarButton : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
       // outBarButton.title = "97 items"
        outBarButton.tintColor = .white

        //outBarButton.isEnabled = false
           // outBarButton.action =
        return outBarButton
        }()
    
    /***/
    lazy var filterBarButton : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        outBarButton.title = "Filter"
        outBarButton.tintColor = .white
        outBarButton.image?.withRenderingMode(.alwaysOriginal)
        return outBarButton
        }()
     
    /**
     Number of items label
     */
    lazy var nbofItemLabel: UILabel =
        {
        let outLabel = UILabel()
        outLabel.textColor = UIColor.black
        return outLabel
        }()


    /***/
    lazy var categoryStackView : UIStackView =
        {
       let outStackView = UIStackView()
        outStackView.translatesAutoresizingMaskIntoConstraints = false
        outStackView.axis = .horizontal
        outStackView.alignment = .center
		outStackView.distribution = .equalSpacing
        outStackView.spacing = 10
        return outStackView
        }()

    /***/
    lazy var collectionFlowLayout : UICollectionViewFlowLayout =
		{
        let outLayout = UICollectionViewFlowLayout()
        outLayout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        outLayout.minimumInteritemSpacing = 10
        outLayout.minimumLineSpacing = 10
        outLayout.itemSize = UICollectionViewFlowLayout.automaticSize
        return outLayout
        }()
    
    /***/
    lazy var refreshControl : UIRefreshControl =
        {
        let outRefreshControl = UIRefreshControl()
        outRefreshControl.addTarget(self, action: #selector(onPullToRefresh(_:)), for: .valueChanged)
        return outRefreshControl
        }()
    
    /***/
    lazy var itemCollectionView : UICollectionView =
        {
        let outCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: collectionFlowLayout)
        outCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCell")
        outCollectionView.backgroundColor = UIColor.white
        outCollectionView.translatesAutoresizingMaskIntoConstraints = false
        outCollectionView.alwaysBounceVertical = true
        outCollectionView.refreshControl = refreshControl
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
    
    /**
     Called when user wants to refresh the UICollectionView
     */
    @objc
    private func onPullToRefresh(_ sender: Any)
        {
        viewModel.onPullToRefresh()
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
        // Create a first button named "Tout" that represents the default condition
        let vAllBtn = createCatBtn(inTitle: AppStrings.kAll)
        // Auto-select it
        setCatBtnSelectedUI(inBtn: vAllBtn)
        // Add it to the stack view
        categoryStackView.addArrangedSubview(vAllBtn)
        // Also add it to the list of buttons
        categoryBtns.append(vAllBtn)
		// Then loop over all catefgories and create a button for it
        for vCategory in inListOfCategory.listOfCategory.enumerated()
            {
            // Create the button
            let vCatBtn = createCatBtn(inTitle: vCategory.element.name)
            // Adding a tag according to the object id
            vCatBtn.tag = vCategory.element.id
            // Add it to the stack view
            categoryStackView.addArrangedSubview(vCatBtn)
            // Also add it to the list of buttons
            categoryBtns.append(vCatBtn)
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
        ZenLog.d("ShopViewController : pushListOfItem")
        DispatchQueue.main.async
            {
            self.items = inListOfItem.listOfItem
            self.itemCollectionView.reloadData()
            }
        }
    
    /**
     See ShopViewDelegate#pushListOfItem()
     */
    func pushNbOfItems( inNbOfItems : String )
        {
        ZenLog.d("ShopViewController : pushNbOfItems \(inNbOfItems)")
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
        ZenLog.d("ShopViewController : popError\(inErrorMsg)")
        popDialog(inTitle: AppStrings.kErrorTitle, inMsg: inErrorMsg, inWithOkBtn: true)
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
    
    /**
     See ShopViewDelegate#endRefreshing()
     */
    func endRefreshing()
        {
        refreshControl.endRefreshing()
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

