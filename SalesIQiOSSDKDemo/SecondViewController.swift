//
//  SecondViewController.swift
//  SalesIQiOSSDKDemo
//
//  Created by Madhusudhan Rao on 28/06/18.
//  Copyright © 2018 Madhusudhan Rao. All rights reserved.
//

import UIKit
import Mobilisten
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ZohoSalesIQ.Tracking.setPageTitle("SalesIQ Demo | Second View")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func customAction(sender:UIButton){
        ZohoSalesIQ.Tracking.setCustomAction("CustomAction") //To set any custom action performed
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
