//
//  ViewController.swift
//  SalesIQiOSSDKDemo
//
//  Created by Madhusudhan Rao on 28/06/18.
//  Copyright © 2018 Madhusudhan Rao. All rights reserved.
//

import UIKit
import Mobilisten

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        ZohoSalesIQ.showLiveChat(true) //To show live chat button on this controller
        
        ZohoSalesIQ.Tracking.setPageTitle("SalesIQ Demo | First View")
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

