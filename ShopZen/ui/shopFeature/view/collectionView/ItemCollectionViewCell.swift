//
//  ItemCollectionViewCell.swift
//  ShopZen
//
//  Created by Kevin on 08/05/2022.
//

import Foundation
import UIKit

/***/
class ItemCollectionViewCell : UICollectionViewCell
    {
      
    public lazy var urgentIconView : UIImageView =
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
    public lazy var img 	: ImageCached =
        {
        let outImg  = ImageCached()
        outImg      .translatesAutoresizingMaskIntoConstraints = false
      //  outImg      .setContentHuggingPriority(.defaultLow, for: .vertical)
        outImg      .contentMode      = .scaleAspectFill
        outImg      .clipsToBounds    = true
        return      outImg
        }()
    
    /***/
    public lazy var title 	: UILabel =
        {
        let outLabel = UILabel()
        outLabel.numberOfLines = 0
        outLabel.translatesAutoresizingMaskIntoConstraints = false
        outLabel.textColor = .black
        outLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        //outLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        return outLabel
        }()
    
    /***/
    public lazy var price 	: PaddingLabel =
        {
        let outLabel = PaddingLabel()
        outLabel.numberOfLines = 0
        outLabel.translatesAutoresizingMaskIntoConstraints = false
        outLabel.textColor = .white
        //outLabel.text = "25.0 $"
        outLabel.textAlignment = .center
        //outLabel.backgroundColor = .systemBlue
        outLabel.layer.cornerRadius = 18
        outLabel.layer.masksToBounds = true
        outLabel.layer.backgroundColor = ColorPalette.AccentColor.cgColor
        outLabel.edgeInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        //outLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        return outLabel
        }()
    
    /***/
    public lazy var categoryName : PaddingLabel =
        {
        let outLabel = PaddingLabel()
        outLabel.numberOfLines = 0
        outLabel.translatesAutoresizingMaskIntoConstraints = false
        outLabel.textColor = ColorPalette.SecondaryColor
        //outLabel.text = "Bricolage"
        outLabel.textAlignment = .left
        let italicFont = UIFont.italicSystemFont(ofSize:13)
        outLabel.font = italicFont
        
        //outLabel.backgroundColor = .systemBlue
        //outLabel.layer.cornerRadius = 10
        //outLabel.layer.masksToBounds = true
        //outLabel.layer.backgroundColor = UIColor.systemRed.cgColor
        //outLabel.edgeInset = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        return outLabel
        }()
    
    /***/
    public lazy var indicator : UIActivityIndicatorView =
        {
        let view        = UIActivityIndicatorView()
        view.style      = .large
        return          view
        }()
    
    /***/
    override init(frame: CGRect)
        {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        }
      
    /***/
    required init?(coder aDecoder: NSCoder)
        {
        fatalError("init(coder:) has not been implemented")
        }
        
	/***/
    func setupViews()
        {
        
        backgroundColor = .white
        contentView.addSubViews(urgentIconView, img, categoryName, title, price)
        roundView()
        }
        
        
	 /**
      Configure the UI widgets constraints
      */
     func setupConstraints()
        {
        // ------------
        // Constraints for img
        // ------------
        img.topAnchor                       .constraint(equalTo: topAnchor).isActive = true
        img.leftAnchor                      .constraint(equalTo: leftAnchor).isActive = true
        img.trailingAnchor                  .constraint(equalTo: trailingAnchor).isActive = true

        // ------------
        // Constraints for urgentIconView
        // ------------
        urgentIconView.topAnchor            .constraint(equalTo: img.topAnchor).isActive = true
        urgentIconView.trailingAnchor       .constraint(equalTo: img.trailingAnchor).isActive = true
        urgentIconView.widthAnchor          .constraint(equalToConstant: 70).isActive = true
        urgentIconView.heightAnchor         .constraint(equalToConstant: 70).isActive = true
        contentView                         .bringSubviewToFront(urgentIconView)

        
        // ------------
        // Constraitns for categoryName
        // ------------
        categoryName.topAnchor              .constraint(equalTo: img.bottomAnchor, constant: 4.0).isActive = true
        categoryName.leadingAnchor          .constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        categoryName.trailingAnchor         .constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        categoryName.heightAnchor           .constraint(equalToConstant: 35).isActive = true

        // ------------
        // Constraints for title
        // ------------
        title.topAnchor           		 .constraint(equalTo: categoryName.bottomAnchor, constant: 4.0).isActive = true
        title.leadingAnchor       		 .constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        title.trailingAnchor    		.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
            
        // ------------
        // Constraints for price
        // ------------
        price.topAnchor            .constraint(equalTo: title.bottomAnchor, constant: 16.0).isActive = true
        price.bottomAnchor        .constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor, constant: -16.0).isActive = true
        price.centerXAnchor        .constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        price.heightAnchor        .constraint(equalToConstant: 35).isActive = true
        }
        
     override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes
        {
        /*layoutIfNeeded()
        label.preferredMaxLayoutWidth = label.bounds.size.width
        layoutAttributes.bounds.size.height = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes*/
          let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================



extension ItemCollectionViewCell
    {

    class func getProductHeightForWidth(props: String, width: CGFloat) -> CGFloat
        {
        // magic numbers explanation:
        // 16 - offset between image and price
        // 22 - height of price
        // 8 - offset between price and title
       // var resultingHeight: CGFloat = 24 + (35+8) + 32
        var resultingHeight : CGFloat = 115 + 24//+ 115//+ 35 + 35//16 + 22 + 8 + 32 + 70
        // get image height based on width and aspect ratio
        let imageHeight = width * 2 / 3
        resultingHeight += imageHeight

        /*let categoryHeight = "Bricolage".getHeight(font: .systemFont(ofSize: 12), width: width  )
        resultingHeight += categoryHeight
        
        print("category height: \(categoryHeight)")*/
        
        
        let titleHeight = props.getHeight(font: .systemFont(ofSize: 13), width: width  )
        resultingHeight += titleHeight

        let priceHeight = "25 $".getHeight(font: .systemFont(ofSize: 13), width: width  )
        resultingHeight += priceHeight

        return resultingHeight //+ 80 // reasonable padding
        }
    }


extension UICollectionViewCell
	{
    func roundView()
		{
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
    
        /*layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath*/
        layer.cornerRadius = radius
		}
	}


extension String {

    func getHeight(font: UIFont, width: CGFloat) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font
        ]
        let attributedText = NSAttributedString(string: self, attributes: attributes)
        let constraintBox = CGSize(width: width, height: .greatestFiniteMagnitude)
        let textHeight = attributedText.boundingRect(
            with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
            .height.rounded(.up)
        return textHeight
    }
}

