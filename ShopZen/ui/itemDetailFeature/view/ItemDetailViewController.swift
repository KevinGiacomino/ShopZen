//
//  ItemDetailViewController.swift
//  ShopZen
//
//  Created by Spirtech on 10/05/2022.
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
		return 				outScrolllView
		}()
	
    /***/
    private lazy var bgOverlay      : UIView =
        {
        let outView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        outView.backgroundColor = .black
        outView.alpha   = 0.4
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
        outImg.setContentHuggingPriority(.defaultLow, for: .vertical)

        outImg.contentMode = .scaleAspectFill
        outImg.clipsToBounds = true

        return outImg
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

        //outLabel.text = "25.0 $"
        outLabel.textAlignment = .center
        //outLabel.backgroundColor = .systemBlue
        outLabel.layer.cornerRadius = 12
        outLabel.layer.masksToBounds = true
        outLabel.layer.backgroundColor = UIColor.white.cgColor
        outLabel.edgeInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        /*outLabel.layer.shadowColor = UIColor.black.cgColor
            outLabel.layer.shadowRadius = 0.3
            outLabel.layer.shadowOpacity = 0.5
        outLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        outLabel.layer.masksToBounds = false*/
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
	private lazy var separationView : UIView	=
		{
		let outView	= UIView()
		outView			.translatesAutoresizingMaskIntoConstraints = false
		outView.backgroundColor = .darkGray
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
		
    private lazy var shopToolbarView : UIToolbar =
        {
        let outToolBar  = UIToolbar()
        outToolBar.translatesAutoresizingMaskIntoConstraints = false
        outToolBar.barTintColor = ColorPalette.AccentColor
        return outToolBar
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
     Called when users taps on the share button
     Prevent the view model
     */
    @objc func onShareBtnTapped(sender: UIButton!)
        {
        ZenLog.d("ItemDetailViewController onShareBtnTapped")
        viewModel.onShareBtnTapped()
        }
            
    // MARK: - From delegate (MVVM)

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
		//--------------
		// Configure main view :
		// --------------
		view.backgroundColor 	= ColorPalette.AppBgColor
		view					.addSubview(mainScrollView,  anchors: [.leading(0), .trailing(0), .top(0), .bottom(0)])
   //     mainScrollView.contentSize = CGSize(width: view.frame.width, height: 800.0)
          //  mainScrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
                  
		// --------------
		// Configure image background view:
		// --------------
        item_BgView            .loadImageWithUrl(inUrl: inImgURL)

        mainScrollView			.addSubview(item_BgView, anchors: [.leading(0), .trailing(0), .top(0), .height(view.frame.height / 4)])
		mainScrollView.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        // --------------
        // Configure back button view:
        // --------------
        view.addSubview(backBtn, anchors: [.height(45), .width(45), .top(8), .leading(8)])
        // --------------
        // Configure share view:
        // --------------
        view.addSubview(shareBtn, anchors: [.height(45), .width(45), .top(8)])
        shareBtn.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12).isActive = true
            
        // --------------
        // Configure image background overlay view:
        // --------------
        item_BgView.addSubview(bgOverlay)
		// --------------
		// Configure urgent icon view if necessary :
		// --------------
        view					.addSubview(item_urgentIconView, anchors: [.height(70), .width(70)])
		item_urgentIconView	.topAnchor            .constraint(equalTo: item_BgView.topAnchor).isActive = true
        item_urgentIconView	.trailingAnchor            .constraint(equalTo: item_BgView.trailingAnchor).isActive = true
        view.bringSubviewToFront(item_urgentIconView)
		item_urgentIconView	.isHidden = !inIsUrgent
        // --------------
        // Configure category view :
        // --------------
        item_CategoryView.text = inCatName
        view            .addSubview(item_CategoryView)
        item_CategoryView    .bottomAnchor            .constraint(equalTo: item_BgView.bottomAnchor, constant: 12).isActive = true
        item_CategoryView    .trailingAnchor            .constraint(equalTo: item_BgView.trailingAnchor, constant: -24).isActive = true
        view.bringSubviewToFront(item_CategoryView)

		// --------------
		// Configure content view :
		// --------------
		mainScrollView			.addSubview(contentView, anchors: [.leading(16), .trailing(-16), .bottom(-16)])
		contentView			.topAnchor.constraint(equalTo: item_BgView.bottomAnchor, constant: 0).isActive = true
        //contentView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
		//contentView			.widthAnchor.cons
		// --------------
		// Configure title view :
		// --------------
		item_TitleLabel.text 	= inTitle
		contentView			.addSubview(item_TitleLabel, anchors: [.leading(0), .trailing(0), .top(24)])
		// --------------
		// Configure price and date stack view :
		// --------------
		item_PriceLabel		.text = inPrice //+ " - " + inCatName
		item_DateLabel			.text = inDate
		contentView			.addSubview(priceAndDateStackView, anchors: [.leading(0), .trailing(0)])
		priceAndDateStackView	.topAnchor.constraint(equalTo: item_TitleLabel.bottomAnchor, constant: 16).isActive = true
		// --------------
		// Configure description seperation view :
		// --------------
		contentView			.addSubview(separationView, anchors: [.leading(0), .trailing(0), .height(1.0)])
		separationView			.topAnchor.constraint(equalTo: priceAndDateStackView.bottomAnchor, constant: 24).isActive = true
		// --------------
		// Configure description title view :
		// --------------
		contentView			.addSubview(descTitle, anchors: [.leading(0), .trailing(0)])
		descTitle				.topAnchor.constraint(equalTo: separationView.bottomAnchor, constant: 16).isActive = true
		// --------------
		// Configure description view :
		// --------------
		item_DescView			.text = inDesc
            contentView			.addSubview(item_DescView, anchors: [.leading(0), .trailing(0)])
		item_DescView			.topAnchor.constraint(equalTo: descTitle.bottomAnchor, constant: 16).isActive = true
		//item_DescView			.widthAnchor.constraint(greaterThanOrEqualTo:  mainScrollView.widthAnchor).isActive = true
            
        // --------------
        // Configure shop toolbar:
        // --------------
        view.addSubview(shopToolbarView, anchors: [.leading(0), .trailing(0), .bottom(0)])
            
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
        self.dismiss(animated: true, completion: nil)
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
