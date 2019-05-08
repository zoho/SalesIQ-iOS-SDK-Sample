//
//  ZSIQDetailCell.swift
//  Zylker
//
//  Created by gopi-6625 on 12/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

class ZSIQDetailCell: UITableViewCell {

    @IBOutlet weak var parkingLabel: UILabel!
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var sqftLabel: UILabel!
    @IBOutlet weak var possDateLabel: UILabel!
    @IBOutlet weak var bhkLabel: UILabel!
    @IBOutlet weak var propertyPrice: UILabel!
    @IBOutlet weak var propertyStatus: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var propertyDesc: UILabel!
    @IBOutlet weak var statusWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bhkWidthConstraint: NSLayoutConstraint!
    var dataObject : ZSIQEntityObject? {
        
        didSet {
            if dataObject != nil {
                updateUIElements()
            }
        }
    }

    private func updateUIElements() {
        parkingLabel.text = dataObject?.entityParkingAvailable
        propertyName.text = dataObject?.entityTitle
        sqftLabel.text = dataObject?.entitySqftArea
        possDateLabel.text = dataObject?.entityPossDate
        bhkLabel.text = dataObject?.entityRoomsAvailable
        propertyPrice.text = dataObject?.entityPrice
        
        propertyStatus.text = dataObject?.entityStatus
        
        let padding = CGFloat(20.0)
        var attributedString = NSAttributedString(string: propertyStatus.text!, attributes: [NSAttributedString.Key.font:propertyStatus.font])
        var requiredRect = attributedString.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: propertyStatus.frame.height), options: .usesLineFragmentOrigin, context: nil)
        statusWidthConstraint.constant = requiredRect.width + padding
        attributedString = NSAttributedString(string: bhkLabel.text!, attributes: [NSAttributedString.Key.font:bhkLabel.font])
        requiredRect = attributedString.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: bhkLabel.frame.height), options: .usesLineFragmentOrigin, context: nil)
        bhkWidthConstraint.constant = requiredRect.width + padding
        addressLabel.text = dataObject?.entityAddress
        let paragraphAtt = NSMutableParagraphStyle()
        paragraphAtt.lineSpacing = 2.0
        attributedString = NSAttributedString(string: (dataObject?.entityDescription)!, attributes: [NSAttributedString.Key.paragraphStyle:paragraphAtt])
        propertyDesc.attributedText = attributedString
        
    }
    
    override func awakeFromNib() {
        let width = CGFloat(1.0)
        let color = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0).cgColor
        bhkLabel.layer.borderColor = color
        bhkLabel.layer.borderWidth = width
        propertyStatus.layer.borderColor = color
        propertyStatus.layer.borderWidth = width
        
    }

    class func getIDentifier()->String {
        return "Detail Cell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
