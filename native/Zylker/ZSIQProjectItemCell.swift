//
//  ZSIQProjectItemCell.swift
//  Zylker
//
//  Created by gopi-6625 on 07/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

class ZSIQProjectItemCell: UICollectionViewCell {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var sqftLabel: UILabel!
    
    var dataObject : ZSIQEntityObject? {
        
        didSet {
            if dataObject != nil {
                updateUIElements()
            }
        }
    }

    class func getIDentifier()->String {
        return "ProjectItemCell"
    }
    
    private func updateUIElements() {
        
        let entityImageName = dataObject?.entityImage
        let entityImage = UIImage(named: entityImageName!)
        itemImage.image = entityImage
        itemName.text = dataObject?.entityTitle
        itemPrice.text = dataObject?.entityPrice
        sqftLabel.text = dataObject?.entitySqftArea
        
        
    }

}

