//
//  ZSIQAdditionalDetailCell.swift
//  Zylker
//
//  Created by gopi-6625 on 12/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

class ZSIQAdditionalDetailCell: UITableViewCell {

    @IBOutlet weak var launchDateDesc: UILabel!
    @IBOutlet weak var projectSizeDesc: UILabel!
    @IBOutlet weak var projectAreaDesc: UILabel!
    @IBOutlet weak var commuteDesc: UILabel!
    @IBOutlet weak var essentialDesc: UILabel!
    @IBOutlet weak var lifestyleDesc: UILabel!
    var dataObject : ZSIQEntityObject? {
        
        didSet {
            if dataObject != nil {
                updateUIElements()
            }
        }
    }
    
    private func updateUIElements() {
        
        let paragraphAtt = NSMutableParagraphStyle()
        paragraphAtt.lineSpacing = 2.0
        var attString = NSAttributedString(string: (dataObject?.entityCommute)!, attributes: [NSAttributedString.Key.paragraphStyle:paragraphAtt])
        projectAreaDesc.text = dataObject?.entityProjectArea
        projectSizeDesc.text = dataObject?.entityProjectSize
        commuteDesc.attributedText = attString
        attString = NSAttributedString(string: (dataObject?.entityEssentials)!, attributes: [NSAttributedString.Key.paragraphStyle:paragraphAtt])
        essentialDesc.attributedText = attString
        attString = NSAttributedString(string: (dataObject?.entityLifestyle)!, attributes: [NSAttributedString.Key.paragraphStyle:paragraphAtt])
        lifestyleDesc.attributedText = attString
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func getIDentifier()->String {
        return "Additional Detail Cell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
