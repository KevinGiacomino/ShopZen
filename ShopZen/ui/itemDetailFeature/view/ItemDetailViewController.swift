//
//  ItemDetailViewController.swift
//  ShopZen
//
//  Created by Kevin on 10/05/2022.
//

import Foundation
import UIKit

/**
 Item detail view
 This class is responsible to manages the UI of this view.
 */
class ItemDetailViewController : BaseViewController<ItemDetailDelegate, ItemDetailViewModel>,
    ItemDetailDelegate
	{
	    
    // MARK: - UI widgets

	/***/
    lazy var mainScrollView : UIScrollView =
		{
		let outScrolllView	= UIScrollView()
		outScrolllView		.translatesAutoresizingMaskIntoConstraints = false
        outScrolllView		.backgroundColor = ColorPalette.AppBgColor
		return 				outScrolllView
		}()
	
    /***/
    lazy var bgOverlay      : UIView =
        {
        let outView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
		outView.translatesAutoresizingMaskIntoConstraints = false

        outView.backgroundColor = .black
        outView.alpha   = 0.4
        return outView
        }()
    
    /***/
    lazy var btnContainerView : UIView =
		{
		let outView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
		outView.translatesAutoresizingMaskIntoConstraints = false
		outView.backgroundColor = .clear
		return outView
		}()
		
    /***/
    lazy var backBtn        : UIButton =
        {
        let outBtn      = UIButton()
        outBtn.translatesAutoresizingMaskIntoConstraints = false
        outBtn.makeRoundedWithIcon(inImage: ImagePalette.kCloseIco)
        outBtn.addTarget(self, action: #selector(onBackBtnTapped), for: .touchUpInside)
        return outBtn
        }()
    
    /***/
    lazy var shareBtn        : UIButton =
        {
        let outBtn      = UIButton()
        outBtn.translatesAutoresizingMaskIntoConstraints = false
        outBtn.makeRoundedWithIcon(inImage: ImagePalette.kShareIco)
        outBtn.addTarget(self, action: #selector(onShareBtnTapped), for: .touchUpInside)
        return outBtn
        }()
    
	/***/
    lazy var item_BgView 	: ImageCached =
        {
        let outImg  = ImageCached()
        outImg      .translatesAutoresizingMaskIntoConstraints = false
        outImg      .contentMode      = .scaleAspectFill
        outImg      .clipsToBounds    = true
        return      outImg
        }()
        
    /***/
    lazy var item_urgentIconView : UIImageView =
        {
        let outImg = UIImageView()
        outImg.translatesAutoresizingMaskIntoConstraints = false
        //outImg.backgroundColor = .white
        outImg.image = ImagePalette.kUrgentIco
        //outImg.setContentHuggingPriority(.defaultLow, for: .vertical)

        outImg.contentMode = .scaleAspectFill
        outImg.clipsToBounds = true

        return outImg
        }()
        
    
    lazy var scrollView : UIView =
        {
        let outScrollView = UIScrollView()
        outScrollView.translatesAutoresizingMaskIntoConstraints = false
        return outScrollView
        }()
    
	/***/
    lazy var contentView : UIView =
		{
		let outView = UIView()
		outView.translatesAutoresizingMaskIntoConstraints = false
		outView.backgroundColor = .clear
		return outView
		}()
        
    /***/
    lazy var item_CategoryView : PaddingLabel =
        {
        let outLabel = PaddingLabel()
        outLabel.numberOfLines = 0
        outLabel.translatesAutoresizingMaskIntoConstraints = false
        outLabel.textColor = ColorPalette.SecondaryColor
        outLabel.font = .italicSystemFont(ofSize: 14)
        outLabel.layer.borderWidth = 0.5
        outLabel.layer.borderColor = ColorPalette.SecondaryColor.cgColor
        outLabel.textAlignment = .center
        outLabel.layer.cornerRadius = 12
        outLabel.layer.masksToBounds = true
        outLabel.layer.backgroundColor = UIColor.white.cgColor
        outLabel.edgeInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        return outLabel
        }()
    
	/***/
    lazy var item_TitleLabel : UILabel =
		{
		let outLabel = UILabel()
		outLabel.translatesAutoresizingMaskIntoConstraints = false
		outLabel.font = .boldSystemFont(ofSize: 18)
		outLabel.textColor = .black
		outLabel.lineBreakMode = .byWordWrapping
		outLabel.numberOfLines = 0
		return outLabel
		}()
	
	/***/
    lazy var item_PriceLabel : UILabel =
		{
		let outLabel		= UILabel()
		outLabel			.translatesAutoresizingMaskIntoConstraints = false
		outLabel.font 		= .boldSystemFont(ofSize: 18)
		outLabel.textColor 	= ColorPalette.AccentColor
		return outLabel
		}()
		
	/***/
	private lazy var item_DateLabel : UILabel =
		{
		let outLabel		= UILabel()
		outLabel			.translatesAutoresizingMaskIntoConstraints = false
		outLabel.font 		= .systemFont(ofSize: 15)
		outLabel.textColor 	= .darkGray
		return outLabel
		}()
	
	/***/
    lazy var priceAndDateStackView : UIStackView =
		{
		let outStackView 	= UIStackView(arrangedSubviews: [item_PriceLabel, item_DateLabel])
		outStackView		.translatesAutoresizingMaskIntoConstraints = false
        outStackView		.axis = .vertical
        outStackView		.alignment = .leading
		outStackView		.distribution = .equalSpacing
        outStackView		.spacing = 5
		return 				outStackView
		}()
       
	/***/
    lazy var descSeparatorView : UIView	=
		{
		let outView		= UIView()
		outView			.translatesAutoresizingMaskIntoConstraints = false
		outView			.backgroundColor = .darkGray
		return outView
		}()
       
	/***/
    lazy var descTitle : UILabel =
		{
		let outLabel		= UILabel()
		outLabel			.translatesAutoresizingMaskIntoConstraints = false
		outLabel.font 		= .boldSystemFont(ofSize: 18)
		outLabel.text		= "Description"
		outLabel.textColor 	= .black
		return outLabel
		}()
		
	/***/
    lazy var item_DescView : UITextView	=
		{
		let outTextView				= UITextView()
		outTextView					.translatesAutoresizingMaskIntoConstraints = false
		outTextView.font 			= .systemFont(ofSize: 16)
		outTextView.textColor 		= .black
		outTextView					.sizeToFit()
		outTextView.backgroundColor	= .clear
		outTextView.isScrollEnabled	= false
        outTextView.isUserInteractionEnabled = false
			//	outTextView.lineBreakMode = .byWordWrapping
		//outTextView.numberOfLines = 0
		return outTextView
		}()
		
	/***/
    lazy var shopBtn		: UIButton =
		{
		let outBtn				= UIButton()
		outBtn					.translatesAutoresizingMaskIntoConstraints = false
		outBtn					.setTitleColor(.white, for: .normal)
		outBtn					.setTitle("Acheter", for: .normal)
		outBtn					.sizeToFit()
		outBtn					.backgroundColor 	= ColorPalette.AccentColor
		outBtn					.layer.cornerRadius = 8
		outBtn					.layer.borderWidth 	= 1
		outBtn					.layer.borderColor = ColorPalette.AccentColor.cgColor
		return 					outBtn
		}()
		
    /***/
    lazy var shopToolbarView : UIToolbar =
        {
        let outToolbar	 = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 44.0)))
        outToolbar		.barStyle = .default
        outToolbar		.isTranslucent = false
        //outToolbar.backgroundColor = ColorPalette.AccentColor
		outToolbar		.tintColor = ColorPalette.AccentColor
		outToolbar		.barTintColor = .white
        outToolbar		.sizeToFit()
		   // Adding Button ToolBar
        //let vContactBtn = UIBarButtonItem(image: UIImage(systemName: "mail"), style: .plain, target: self, action: #selector(onContactBtnTapped))
       // let vContactBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(onContactBtnTapped))
        let vContactBtn = UIBarButtonItem(image: UIImage(systemName: "mail")!, title: "Contactez", target: self, action: #selector(onContactBtnTapped))
        let vSpaceBtn 	= UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
     
		
        outToolbar		.setItems([vSpaceBtn, vContactBtn], animated: false)
        outToolbar		.isUserInteractionEnabled = true
        return 			outToolbar
        }()
    
    
    // MARK: - Tapped methods
    
    /**
     Called when users taps on the back button
     Prevent the view model
     */
    @objc func onBackBtnTapped(sender: UIButton!)
        {
        ZenLog.d("ItemDetailViewController onBackBtnTapped")
        viewModel.onBackBtnTapped()
        }
    
    /**
     Called when user taps on the share button
     Prevent the view model
     */
    @objc func onShareBtnTapped(sender: UIButton!)
        {
        ZenLog.d("ItemDetailViewController onShareBtnTapped")
        viewModel.onShareBtnTapped()
        }
        
	/**
	 Called whe user taps on the contact button from the UIToolbar
	 Prevent the view model
	 */
    @objc func onContactBtnTapped(sender: UITabBarItem!)
		{
		ZenLog.d("ItemDetailViewController onContactBtnTapped")
		viewModel.onContactBtnTapped()
		}
		
    // MARK: - From delegate (MVVM)

	
    lazy public var nbOfItemsBarBtn : UIBarButtonItem =
        {
        let outBarButton = UIBarButtonItem()
        outBarButton.tintColor = .red
        //outBarButton.action = #selector(onFilterTapped)
       outBarButton.title                 = "97 articles"
        return outBarButton
        }()
    
    

	/**
	 See ItemDetailDelegate#configureItemView()
	 */
	func configureItemView
		(
		inImgURL 	: 			URL,
		inIsUrgent	: 			Bool,
		inTitle		: 			String,
		inCatName	:			String,
		inDesc  	: 			String,
		inPrice 	: 			String,
		inDate		: 			String
		)
		{
        ZenLog.d("ItemDetailViewController configureItemView")
        navigationItem.leftBarButtonItem    = nbOfItemsBarBtn

		//--------------
		// Configure main view :
		// --------------
		view.backgroundColor 	= ColorPalette.AppBgColor
		configureScrollView()

		// --------------
		// Configure image background view:
		// --------------
        item_BgView            .loadImageWithUrl(inUrl: inImgURL)
        setConstraintsFor_itemBgView()
        // --------------
        // Configure back container view:
        // --------------
        setConstraintsFor_btnContainerView()
        // --------------
        // Configure share view:
        // --------------
        setConstraintsFor_shareBtn()
        // --------------
        // Configure image background overlay view:
        // --------------
        item_BgView.addSubview(bgOverlay)
		// --------------
		// Configure urgent icon view if necessary :
		// --------------
		item_urgentIconView	.isHidden = !inIsUrgent
        setConstraintsFor_urgentIconView()
        // --------------
        // Configure category view :
        // --------------
        item_CategoryView.text = inCatName
        setConstraintsFor_categoryView()

		// --------------
		// Configure title view :
		// --------------
		item_TitleLabel.text 	= inTitle
        setConstraintsFor_titleLabel()

		// --------------
		// Configure price and date stack view:
		// --------------
		item_PriceLabel		    .text = inPrice //+ " - " + inCatName
		item_DateLabel			.text = inDate
		setConstraintsFor_priceAndDateStackView()
		// --------------
		// Configure description seperation view:
		// --------------
		setConstraintsFor_descSeparatorView()
		// --------------
		// Configure description title view :
		// --------------
		setConstraintsFor_descTitle()
		// --------------
		// Configure description view:
		// --------------
		item_DescView			.text = inDesc
        setConstraintsFor_descView()
		//item_DescView			.widthAnchor.constraint(greaterThanOrEqualTo:  mainScrollView.widthAnchor).isActive = true
            
        // --------------
        // Configure shop toolbar:
        // --------------
        setConstraintsFor_shopToolbarView()
            
		// --------------
		// Configure shop button :
		// --------------
		/*contentView			.addSubview(shopBtn, anchors: [.leading(16), .trailing(-16), .centerX(0), .centerY(0)])
		shopBtn					.topAnchor.constraint(equalTo: item_DescView.bottomAnchor, constant: 16).isActive = true*/

		}
    
		
    /**
     See ItemDetailDelegate#closeThisView()
     */
    func closeThisView()
        {
        ZenLog.d("ItemDetailViewController closeThisView")

        self.dismiss(animated: true, completion: nil)
        }
	
    /**
     See ItemDetailDelegate#shareItemToSocialNetwork()
     */
    func shareItemToSocialNetwork()
        {
        ZenLog.d("ItemDetailViewController shareItemToSocialNetwork")
        popDialog(inTitle: AppStrings.kNotImplementedYet, inMsg: AppStrings.kShareSocialReason, inWithOkBtn: true)
        }
    
    /**
     See ItemDetailDelegate#openMailToContactSeller()
     */
    func openMailToContactSeller()
        {
        popDialog(inTitle: AppStrings.kNotImplementedYet, inMsg: AppStrings.kMailClientReason, inWithOkBtn: true)
        }
    
    // MARK: - Methods from Base (View Model)
    
	/***/
	func displayWaitingAnimation(){}
        
	/***/
    func hideWaitingAnimation(){}
    
	/***/
    override func bindViewModelToView() -> ItemDetailViewModel
        {
        return ViewModelFactory.shared.itemDetailViewModel
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================
