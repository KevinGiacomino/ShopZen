//
//  Extension+UIView.swift
//  ShopZen
//
//  Created by Kevin on 07/05/2022.
//

import UIKit

/// Represents a single `NSLayoutConstraint`
enum LayoutAnchor
    {
    case constant(attribute: NSLayoutConstraint.Attribute,
                  relation: NSLayoutConstraint.Relation,
                  constant: CGFloat)

    case relative(attribute: NSLayoutConstraint.Attribute,
                  relation: NSLayoutConstraint.Relation,
                  relatedTo: NSLayoutConstraint.Attribute,
                  multiplier: CGFloat,
                  constant: CGFloat)
                  
  case relativeSafeArea(
                attribute:     NSLayoutConstraint.Attribute,
                relation:     NSLayoutConstraint.Relation,
                relatedTo:     NSLayoutConstraint.Attribute,
                multiplier: CGFloat,
                constant:     CGFloat)
                
    } // end of extension --------------------------------------------------------------

//==============================================================================

// MARK: - Factory methods
extension LayoutAnchor
    {
    static let leading     = relativeSafeArea(attribute: .leading, relation: .equal, relatedTo: .leading)
    static let trailing = relativeSafeArea(attribute: .trailing, relation: .equal, relatedTo: .trailing)
    static let top         = relativeSafeArea(attribute: .top, relation: .equal, relatedTo: .top)
    static let bottom     = relativeSafeArea(attribute: .bottom, relation: .equal, relatedTo: .bottom)
    

    static let centerX     = relativeSafeArea(attribute: .centerX, relation: .equal, relatedTo: .centerX)
    static let centerY     = relativeSafeArea(attribute: .centerY, relation: .equal, relatedTo: .centerY)

    static let width     = constant(attribute: .width, relation: .equal)
    static let height     = constant(attribute: .height, relation: .equal)

    static func constant
        (
        attribute        : NSLayoutConstraint.Attribute,
        relation        : NSLayoutConstraint.Relation
        ) -> (CGFloat) -> LayoutAnchor
        {
        return { constant in .constant(attribute: attribute, relation: relation, constant: constant) }
        }

    static func relative
        (
        attribute        : NSLayoutConstraint.Attribute,
        relation        : NSLayoutConstraint.Relation,
        relatedTo        : NSLayoutConstraint.Attribute,
        multiplier        : CGFloat = 1
        ) -> (CGFloat) -> LayoutAnchor
        {
        return { constant in .relative(attribute: attribute, relation: relation, relatedTo: relatedTo, multiplier: multiplier, constant: constant) }
        }
    
    static func relativeSafeArea
        (
        attribute        : NSLayoutConstraint.Attribute,
        relation        : NSLayoutConstraint.Relation,
        relatedTo        : NSLayoutConstraint.Attribute,
        multiplier        : CGFloat = 1.0
        ) -> (CGFloat) -> LayoutAnchor
        {
        return { constant in   .relativeSafeArea (attribute: attribute, relation: relation,relatedTo: relatedTo,  multiplier: multiplier,  constant: constant) }
        }
    
    } // end of extension --------------------------------------------------------------

//==============================================================================

// MARK: - Conveniences

/**
 Extension for UIView
 
 
	- addSubView()	: Allows to add sub view with anchor(s) directly
	- activate()	: Easily activate anchors constraints to view
 	- addSubViews() : Allows to add multiple sub view at one time

 */
extension UIView
    {
    func addSubview(_ subview: UIView, anchors: [LayoutAnchor])
        {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.activate(anchors: anchors, relativeTo: self)
        }

    func activate(anchors: [LayoutAnchor], relativeTo item: UIView? = nil)
        {
        let constraints = anchors.map { NSLayoutConstraint(from: self, to: item, anchor: $0) }
        NSLayoutConstraint.activate(constraints)
        }
        
	func addSubViews( _ inViews : UIView... )
        {
        for vView in inViews { self.addSubview(vView) }
        }
    }

/**
 Extenstion for NSLayoutConstraint
 */
extension NSLayoutConstraint
    {
    convenience init(from: UIView, to item: UIView?, anchor: LayoutAnchor)
        {
        switch anchor
            {
            case let .constant(attribute: attr, relation: relation, constant: constant):
            
                self.init(
                    item: from,
                    attribute: attr,
                    relatedBy: relation,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: constant
                )
            case let .relative(attribute: attr, relation: relation,relatedTo: relatedTo, multiplier: multiplier,constant: constant):
                        
                self.init(
                    item: from,
                    attribute: attr,
                    relatedBy: relation,
                    toItem: item,
                    attribute: relatedTo,
                    multiplier: multiplier,
                    constant: constant
                )
            case let .relativeSafeArea(attribute: attribute, relation: relation, relatedTo: relatedTo, multiplier: multiplier, constant: constant):
                guard let safeAreaLayoutGuide = item?.safeAreaLayoutGuide else { fatalError("\(String(describing: item)) safeAreaLayoutGuide problem") }
                
                self.init(item: from,
                    attribute: attribute,
                    relatedBy: relation,
                    toItem: safeAreaLayoutGuide,
                    attribute: relatedTo,
                    multiplier: multiplier,
                    constant: constant)
            }
        }
        
    } // end of extension --------------------------------------------------------------

//==============================================================================

