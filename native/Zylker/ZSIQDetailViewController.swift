//
//  ZSIQDetailViewController.swift
//  Zylker
//
//  Created by gopi-6625 on 11/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit

enum ZSIQCellIndex : Int  {
    case ImageCell = 0
    case DetailCell
    case AdditionalCell
}
class ZSIQDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var currentEntity : ZSIQEntityObject?
    var previousScrollOffset : CGFloat = 0.0
    let maxHeaderHeight: CGFloat = 234
    let minHeaderHeight: CGFloat = 44
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = false
        } else {
            // Fallback on earlier versions
        }
//        navigationController?.navigationBar.isHidden = true

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 0.0
        let cellType : ZSIQCellIndex = ZSIQCellIndex(rawValue: indexPath.row)!
        switch cellType {
        case .ImageCell:
            height = 234.0
        case .DetailCell:
            
            let propertyDesc = currentEntity?.entityDescription
            let font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
            let attString = NSAttributedString(string: propertyDesc!, attributes: [NSAttributedString.Key.font : font])
            let cellWidth = (view.frame.width - 32.0)
            let rect = attString.boundingRect(with: CGSize(width: cellWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
            
            height = Double(241.0 + rect.height + 18.0)
        case .AdditionalCell:
            height = 523.0
        }
        return CGFloat(height)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
        let cellType : ZSIQCellIndex = ZSIQCellIndex(rawValue: indexPath.row)!
        
        switch cellType {
        case .ImageCell:
            cell = constructDetailsImageCell(with: indexPath, tableView: tableView)
        case .DetailCell:
            cell = constructDetailCell(with: indexPath, tableView: tableView)
        case .AdditionalCell:
            cell = constructAdditionalDetailsCell(with: indexPath, tableView: tableView)
        }
        
        return cell
    }
    
    private func constructDetailsImageCell(with indexPath: IndexPath, tableView : UITableView)-> ZSIQDetailImageCell {
        
        let identifier = ZSIQDetailImageCell.getIDentifier()
        let tableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ZSIQDetailImageCell
        tableCell.detailImage.image = UIImage(named: (currentEntity?.entityImage)!)
        return tableCell // Need to add datasource on content received
    }

    private func constructAdditionalDetailsCell(with indexPath: IndexPath, tableView : UITableView)-> ZSIQAdditionalDetailCell {
        
        let identifier = ZSIQAdditionalDetailCell.getIDentifier()
        let tableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ZSIQAdditionalDetailCell
        tableCell.dataObject = currentEntity
        return tableCell // Need to add datasource on content received
    }
    
    @IBAction func popAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    private func constructDetailCell(with indexPath: IndexPath, tableView : UITableView)-> ZSIQDetailCell {
        
        let identifier = ZSIQDetailCell.getIDentifier()
        let tableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ZSIQDetailCell
        tableCell.dataObject = currentEntity
        return tableCell // Need to add datasource on content received
    }
    
    /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        
        var newHeight = self.headerHeightConstraint.constant
        if isScrollingDown {
            newHeight = max(self.minHeaderHeight, self.headerHeightConstraint.constant - abs(scrollDiff))
        } else if isScrollingUp {
            newHeight = min(self.maxHeaderHeight, self.headerHeightConstraint.constant + abs(scrollDiff))
        }
        
        if newHeight != self.headerHeightConstraint.constant {
            self.headerHeightConstraint.constant = newHeight
        }
        view.layoutIfNeeded()
        self.previousScrollOffset = scrollView.contentOffset.y
    }
    */
    override func viewWillAppear(_ animated: Bool) {
//        headerHeightConstraint.constant = maxHeaderHeight
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
