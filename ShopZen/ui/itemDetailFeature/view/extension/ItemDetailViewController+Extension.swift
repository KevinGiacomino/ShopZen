//
//  ItemDetailViewController+Extension.swift
//  ShopZen
//
//  Created by Kevin on 14/05/2022.
//

import Foundation


extension ItemDetailViewController
    {
    
// MARK: - Toolbox methods

    
    /**
    Configure the scroll view
    */
    func configureScrollView()
        {
        let vMargins        = view.layoutMarginsGuide
        view                .addSubview(scrollView)
        scrollView          .addSubview(contentView)
        scrollView          .leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView          .trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView          .topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView          .bottomAnchor.constraint(equalTo: vMargins.bottomAnchor).isActive = true
        contentView         .leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView         .trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView         .topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView         .bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView         .widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        }

    /***/
    func setConstraintsFor_itemBgView()
        {
        contentView.addSubview(item_BgView, anchors: [.leading(0), .trailing(0), .top(0), .height(view.frame.height / 4)])
        }
    
    /***/
    func setConstraintsFor_btnContainerView()
        {
        view.addSubview(btnContainerView, anchors: [.leading(0), .trailing(0), .top(0)])
        btnContainerView.addSubview(backBtn, anchors: [.height(45), .width(45), .top(8), .leading(8), .bottom(-16)])
        }
    
    /***/
    func setConstraintsFor_shareBtn()
        {
        btnContainerView.addSubview(shareBtn, anchors: [.height(45), .width(45), .top(8), .bottom(-16)])
        shareBtn.leadingAnchor.constraint(equalTo: backBtn.trailingAnchor, constant: 12).isActive = true
        }
    
    /***/
    func setConstraintsFor_urgentIconView()
        {
        view                    .addSubview(item_urgentIconView, anchors: [.height(70), .width(70)])
        item_urgentIconView    .topAnchor                    .constraint(equalTo: item_BgView.topAnchor).isActive = true
        item_urgentIconView    .trailingAnchor               .constraint(equalTo: item_BgView.trailingAnchor).isActive = true
        }

    /***/
    func setConstraintsFor_categoryView()
        {
        view                    .addSubview(item_CategoryView)
        item_CategoryView        .bottomAnchor            .constraint(equalTo: item_BgView.bottomAnchor, constant: 12).isActive = true
        item_CategoryView        .trailingAnchor          .constraint(equalTo: item_BgView.trailingAnchor, constant: -24).isActive = true
        //view.bringSubviewToFront(item_CategoryView)
        }

    /***/
    func setConstraintsFor_titleLabel()
        {
        contentView            .addSubview(item_TitleLabel, anchors: [.leading(16), .trailing(-16)])//, .top(24)])
        item_TitleLabel        .topAnchor.constraint(equalTo: item_BgView.bottomAnchor, constant: 24).isActive = true
        }

    /***/
    func setConstraintsFor_priceAndDateStackView()
        {
        contentView             .addSubview(priceAndDateStackView, anchors: [.leading(16), .trailing(-16)])
        priceAndDateStackView    .topAnchor.constraint(equalTo: item_TitleLabel.bottomAnchor, constant: 16).isActive = true
        }

    /***/
    func setConstraintsFor_descSeparatorView()
        {
        contentView                .addSubview(descSeparatorView, anchors: [.leading(16), .trailing(-16), .height(1.0)])
        descSeparatorView            .topAnchor.constraint(equalTo: priceAndDateStackView.bottomAnchor, constant: 24).isActive = true
        }

    /***/
    func setConstraintsFor_descTitle()
        {
        contentView            .addSubview(descTitle, anchors: [.leading(16), .trailing(-16)])
        descTitle            .topAnchor.constraint(equalTo: descSeparatorView.bottomAnchor, constant: 16).isActive = true
        }

    /***/
    func setConstraintsFor_descView()
        {
        // margin bottom : 44 to respect the height of the UIToolbar
        contentView            .addSubview(item_DescView, anchors: [.leading(16), .trailing(-16), .bottom(-44)])
        item_DescView            .topAnchor.constraint(equalTo: descTitle.bottomAnchor, constant: 16).isActive = true
        }

    /***/
    func setConstraintsFor_shopToolbarView()
        {
        view.addSubview(shopToolbarView, anchors: [.leading(0), .trailing(0), .bottom(0)])
        }

    }
