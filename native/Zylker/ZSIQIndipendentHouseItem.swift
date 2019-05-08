//
//  ZSIQIndipendentHouseItem.swift
//  Zylker
//
//  Created by gopi-6625 on 08/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

class ZSIQIndipendentHouseItem: UICollectionViewCell {
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseAddress: UILabel!
    @IBOutlet weak var housePrice: UILabel!
    @IBOutlet weak var roomsAvailable: UILabel!
    @IBOutlet weak var houseStatus: UILabel!
    @IBOutlet weak var statusWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var bhkWidthConstraint: NSLayoutConstraint!
    var dataObject : ZSIQEntityObject? {
        
        didSet {
            if dataObject != nil {
                updateUIElements()
            }
        }
    }
    class func getIDentifier()->String {
        return "House Item"
    }

    private func updateUIElements() {
        
        let entityImageName = dataObject?.entityImage
        let entityImage = UIImage(named: entityImageName!)
        houseImageView.image = entityImage
        houseName.text = dataObject?.entityTitle
        houseAddress.text = dataObject?.entityAddress
        housePrice.text = dataObject?.entityPrice
        roomsAvailable.text = dataObject?.entityRoomsAvailable
        houseStatus.text = dataObject?.entityStatus
        
        
        let padding = CGFloat(20.0)
        var attributedString = NSAttributedString(string: houseStatus.text!, attributes: [NSAttributedString.Key.font:houseStatus.font])
        var requiredRect = attributedString.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: houseStatus.frame.height), options: .usesLineFragmentOrigin, context: nil)
        statusWidthConstraint.constant = requiredRect.width + CGFloat(padding)
        attributedString = NSAttributedString(string: roomsAvailable.text!, attributes: [NSAttributedString.Key.font:roomsAvailable.font])
        requiredRect = attributedString.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: roomsAvailable.frame.height), options: .usesLineFragmentOrigin, context: nil)
        bhkWidthConstraint.constant = requiredRect.width + padding
    }
    
    override func awakeFromNib() {
        let width = CGFloat(1.0)
        let color = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0).cgColor
        roomsAvailable.layer.borderColor = color
        roomsAvailable.layer.borderWidth = width
        houseStatus.layer.borderColor = color
        houseStatus.layer.borderWidth = width

    }
}
