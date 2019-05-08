//
//  ZSIQDetailImageCell.swift
//  Zylker
//
//  Created by gopi-6625 on 15/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

class ZSIQDetailImageCell: UITableViewCell {

    @IBOutlet weak var detailImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    class func getIDentifier()->String {
        return "Detail ImageCell"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
