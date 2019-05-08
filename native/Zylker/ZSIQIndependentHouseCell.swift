//
//  ZSIQIndependentHouseCell.swift
//  Zylker
//
//  Created by gopi-6625 on 08/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

class ZSIQIndependentHouseCell: UITableViewCell,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {

    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var showDetailView : ((ZSIQEntityObject)->())?
    var dataSource : [ZSIQEntityObject]?
    
    class func getIDentifier()->String {
        return "Independent HouseCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataSource?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedObject = dataSource![indexPath.row]
        showDetailView!(selectedObject)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = ZSIQIndipendentHouseItem.getIDentifier()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ZSIQIndipendentHouseItem
        cell.dataObject = dataSource?[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size
        let padding = (collectionViewSize.width * 0.096)
        let cellWidth = (frame.size.width == 320.0) ? collectionViewSize.width - padding : 339.0
        return CGSize(width: cellWidth, height: collectionViewSize.height)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
