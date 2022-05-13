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
 It displays a list of Items
 */
class ItemDetailViewController        : BaseViewController<ItemDetailDelegate, ItemDetailViewModel>,
    ItemDetailDelegate
	{
	    
    // MARK: - UI widgets
	

	/***/
	private lazy var mainScrollView : UIScrollView =
		{
		let outScrolllView	= UIScrollView()
		outScrolllView		.translatesAutoresizingMaskIntoConstraints = false
        outScrolllView.backgroundColor = ColorPalette.AppBgColor
		return 				outScrolllView
		}()
	
    /***/
    private lazy var bgOverlay      : UIView =
        {
        let outView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
		outView.translatesAutoresizingMaskIntoConstraints = false

        outView.backgroundColor = .black
        outView.alpha   = 0.4
        return outView
        }()
    
    /***/
    private lazy var btnContainerView : UIView =
		{
		let outView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
		outView.translatesAutoresizingMaskIntoConstraints = false
		outView.backgroundColor = .clear
		return outView
		}()
		
    /***/
    private lazy var backBtn        : UIButton =
        {
        let outBtn      = UIButton()
        outBtn.translatesAutoresizingMaskIntoConstraints = false
        outBtn.makeRoundedWithIcon(inImage: ImagePalette.kCloseIco)
        outBtn.addTarget(self, action: #selector(onBackBtnTapped), for: .touchUpInside)
        return outBtn
        }()
    
    /***/
    private lazy var shareBtn        : UIButton =
        {
        let outBtn      = UIButton()
        outBtn.translatesAutoresizingMaskIntoConstraints = false
        outBtn.makeRoundedWithIcon(inImage: ImagePalette.kShareIco)
        outBtn.addTarget(self, action: #selector(onShareBtnTapped), for: .touchUpInside)
        return outBtn
        }()
    

    
    
	/***/
    private lazy var item_BgView 	: ImageCached =
        {
        let outImg  = ImageCached()
        outImg      .translatesAutoresizingMaskIntoConstraints = false
        outImg      .contentMode      = .scaleAspectFill
        outImg      .clipsToBounds    = true
        return      outImg
        }()
        
	public lazy var item_urgentIconView : UIImageView =
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
        
    
    private lazy var scrollView : UIView =
        {
        let outScrollView = UIScrollView()
        outScrollView.translatesAutoresizingMaskIntoConstraints = false
        return outScrollView
        }()
	/***/
	private lazy var contentView : UIView =
		{
		let outView = UIView()
		outView.translatesAutoresizingMaskIntoConstraints = false
		outView.backgroundColor = .clear
		return outView
		}()
        
    /***/
    private lazy var item_CategoryView : PaddingLabel =
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
	private lazy var item_TitleLabel : UILabel =
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
	private lazy var item_PriceLabel : UILabel =
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
	private lazy var priceAndDateStackView : UIStackView =
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
	private lazy var descSeparatorView : UIView	=
		{
		let outView		= UIView()
		outView			.translatesAutoresizingMaskIntoConstraints = false
		outView			.backgroundColor = .darkGray
		return outView
		}()
       
	/***/
	private lazy var descTitle : UILabel =
		{
		let outLabel		= UILabel()
		outLabel			.translatesAutoresizingMaskIntoConstraints = false
		outLabel.font 		= .boldSystemFont(ofSize: 18)
		outLabel.text		= "Description"
		outLabel.textColor 	= .black
		return outLabel
		}()
		
	/***/
	private lazy var item_DescView : UITextView	=
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
	public lazy var shopBtn		: UIButton =
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
    private lazy var shopToolbarView : UIToolbar =
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
        let vContactBtn = UIBarButtonItem(image: UIImage(systemName: "mail")!, title: "Contactez", target: self, action: nil)
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
        contentView            .addSubview(item_BgView, anchors: [.leading(0), .trailing(0), .top(0), .height(view.frame.height / 4)])
       // mainScrollView			.addSubview(item_BgView, anchors: [.leading(0), .trailing(0), .top(0), .height(view.frame.height / 4)])
	//	mainScrollView.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        // --------------
        // Configure back button view:
        // --------------
        view.addSubview(btnContainerView, anchors: [.leading(0), .trailing(0), .top(0)])
        //btnContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
		btnContainerView.addSubview(backBtn, anchors: [.height(45), .width(45), .top(8), .leading(8), .bottom(-16)])
        // --------------
        // Configure share view:
        // --------------
        btnContainerView.addSubview(shareBtn, anchors: [.height(45), .width(45), .top(8), .bottom(-16)])
        shareBtn.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12).isActive = true
            
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
		contentView			.addSubview(item_TitleLabel, anchors: [.leading(16), .trailing(-16)])//, .top(24)])
		item_TitleLabel		.topAnchor.constraint(equalTo: item_BgView.bottomAnchor, constant: 24).isActive = true
		// --------------
		// Configure price and date stack view:
		// --------------
		item_PriceLabel		 .text = inPrice //+ " - " + inCatName
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
    		
    // MARK: - Toolbox methods

	/**
	 Configure the scroll view
	 */
    private func configureScrollView()
		{
		let vMargins 	= view.layoutMarginsGuide
		view			.addSubview(scrollView)
		scrollView		.addSubview(contentView)
		scrollView		.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		scrollView		.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		scrollView		.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		scrollView		.bottomAnchor.constraint(equalTo: vMargins.bottomAnchor).isActive = true
		contentView	.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		contentView	.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		contentView	.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView	.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView	.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
		}
		
    /***/
    func setConstraintsFor_urgentIconView()
		{
		 view					.addSubview(item_urgentIconView, anchors: [.height(70), .width(70)])
		item_urgentIconView	.topAnchor            		.constraint(equalTo: item_BgView.topAnchor).isActive = true
        item_urgentIconView	.trailingAnchor           	.constraint(equalTo: item_BgView.trailingAnchor).isActive = true
      
        //view.bringSubviewToFront(item_urgentIconView)
		}
    
    /***/
    func setConstraintsFor_categoryView()
		{
		view            		.addSubview(item_CategoryView)
		item_CategoryView    	.bottomAnchor            .constraint(equalTo: item_BgView.bottomAnchor, constant: 12).isActive = true
        item_CategoryView    	.trailingAnchor          .constraint(equalTo: item_BgView.trailingAnchor, constant: -24).isActive = true
        //view.bringSubviewToFront(item_CategoryView)
		}
		
	/***/
	func setConstraintsFor_priceAndDateStackView()
		{
		contentView			 .addSubview(priceAndDateStackView, anchors: [.leading(16), .trailing(-16)])
		priceAndDateStackView	.topAnchor.constraint(equalTo: item_TitleLabel.bottomAnchor, constant: 16).isActive = true
		}
		
	/***/
	func setConstraintsFor_descSeparatorView()
		{
		contentView			    .addSubview(descSeparatorView, anchors: [.leading(16), .trailing(-16), .height(1.0)])
		descSeparatorView			.topAnchor.constraint(equalTo: priceAndDateStackView.bottomAnchor, constant: 24).isActive = true
		}
	
	/***/
	func setConstraintsFor_descTitle()
		{
		contentView			.addSubview(descTitle, anchors: [.leading(16), .trailing(-16)])
		descTitle				.topAnchor.constraint(equalTo: descSeparatorView.bottomAnchor, constant: 16).isActive = true
		}
		
	/***/
	func setConstraintsFor_descView()
		{
		// margin bottom : 44 to respect the height of the UIToolbar
        contentView			.addSubview(item_DescView, anchors: [.leading(16), .trailing(-16), .bottom(-44)])
		item_DescView			.topAnchor.constraint(equalTo: descTitle.bottomAnchor, constant: 16).isActive = true
		}
		
	/***/
	func setConstraintsFor_shopToolbarView()
		{
		view.addSubview(shopToolbarView, anchors: [.leading(0), .trailing(0), .bottom(0)])
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
     See ItemDetailDelegate#closeThisView()
     */
    func shareItemToSocialNetwork()
        {
        ZenLog.d("ItemDetailViewController shareItemToSocialNetwork")
        let vDialog = UIAlertController(title: "Partage sur les réseaux sociaux", message: "Non implémentée pour cette démo :)", preferredStyle: .alert)
        let vOk = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             })
        vDialog.addAction(vOk)
        self.present(vDialog, animated: true, completion: nil)
        }

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
