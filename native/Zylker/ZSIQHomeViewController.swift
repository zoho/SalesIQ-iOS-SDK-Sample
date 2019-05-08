//
//  ZSIQHomeViewController.swift
//  Zylker
//
//  Created by gopi-6625 on 07/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import UIKit
import Mobilisten

class ZSIQHomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var homeObjects = [[ZSIQEntityObject]]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let v = Bundle.main.path(forResource: "ZSIQHomeInfo", ofType: "txt")
        let data = FileManager.default.contents(atPath: v!)
        var objects = [String:Any]()
        do {
            try objects = JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
        } catch  {
            print("Problem in parsing ----------------!")
        }
        
        //print("Fetched Values : \(objects)")
        constructDataObject(objects: objects["items"] as! [[String : Any]])
    }
    
    func constructDataObject(objects : [[String:Any]]) {
        
        for category in objects {
            let values = category.values.first as! [[String:Any]]
            var categoryObject = [ZSIQEntityObject]()
            for entity in values {
            let entityObject = ZSIQEntityObject(entityDict: entity)
            categoryObject.append(entityObject)
            }
            homeObjects.append(categoryObject)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        return .default
    }

    override func viewWillAppear(_ animated: Bool) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height = 396.0
        if indexPath.row == 0 {
            height = 336.0
        }
        return CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeObjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
        if indexPath.row == 0 {
            cell = constructProjectsCell(with: indexPath, tableView: tableView)
            
        }
        else {
            cell = constructIndependentHouseCell(with: indexPath, tableView: tableView)
        }
        
        return cell
    }
    
    private func constructIndependentHouseCell(with indexPath: IndexPath, tableView : UITableView)-> ZSIQIndependentHouseCell {
        
        let identifier = ZSIQIndependentHouseCell.getIDentifier()
        let tableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ZSIQIndependentHouseCell
        let headerString = (indexPath.row == 1) ? "Premium Villas" : "Apartments"
        tableCell.headerLabel.text = headerString
        tableCell.dataSource = homeObjects[indexPath.row]
        tableCell.showDetailView = pushToDetailScreen
        return tableCell // Need to add datasource on content received
    }

    private func constructProjectsCell(with indexPath: IndexPath, tableView : UITableView)-> ZSIQProjectsCell {
        
        let identifier = ZSIQProjectsCell.getIDentifier()
        let tableCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ZSIQProjectsCell
        tableCell.dataSource = homeObjects[indexPath.row]
        tableCell.showDetailView = pushToDetailScreen
        return tableCell // Need to add datasource on content received
    }
    
    func pushToDetailScreen(entityObject : ZSIQEntityObject) {
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail View") as! ZSIQDetailViewController
        detailVC.currentEntity = entityObject
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Pushing to new viewcontroller-------------!")
    }
    */

}

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
