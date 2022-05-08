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
    
    private var myCollectionView : UICollectionView?

    
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
    
    /***/
    lazy public var itemCollectionView : UICollectionView =
        {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 80, height: 80)
                
        let outCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        outCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
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
    

    func initializeUI()
        {
        navigationItem          .title = "Home"
        view.backgroundColor    = .yellow
        //view.addSubview(nbofItemLabel, anchors: [.leading(8), .top(16)])
        nbofItemLabel.text = "98 items"
        // Adding header view
      //  view.addSubview(headerStackView, anchors: [.leading(24), .trailing(-24), .top(16)])

        view.addSubview(itemCollectionView)
        /*itemCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0).isActive = true
        itemCollectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 20).isActive = true
        itemCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20.0).isActive = true
        itemCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20.0).isActive = true*/

        nbOfItemsBarButton.title = "98 items"
        navigationItem.leftBarButtonItem = nbOfItemsBarButton
        navigationItem.rightBarButtonItem =  filterBarButton
         /*   NSLayoutConstraint.activate([
                itemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
                itemCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
                itemCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
                itemCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
            ])*/
        // Adding header view
        //view.addSubview(headerStackView, anchors: [.leading(24), .trailing(-24), .top(16)])
        //view.addSubview(itemCollectionView, anchors: [.leading(24), .trailing(-24), .top(80)])
        // Adding collection view :
        /*let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 40, height: 40)
       
        
        let view = UIView()
           view.backgroundColor = .white
           
           myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
           myCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
           myCollectionView?.backgroundColor = UIColor.white
           
           myCollectionView?.dataSource = self
           myCollectionView?.delegate = self*/

           
           //self.view = view
        }
    
    @objc func onFilterTapped()
        {
       /* var alertView = UIAlertView()
        alertView.addButton(withTitle: "Ok")
        alertView.title = "title"
        alertView.message = "message"
        alertView.show()*/
        print("onFilterTapped")
        }
    
    func displayWaitingAnimation()
        {
        
        }
    
    func hideWaitingAnimation()
        {
        }
    
        
    override func bindViewModelToView() -> ShopViewModel
        {
        return ViewModelFactory.shared().getShopViewModel()
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


