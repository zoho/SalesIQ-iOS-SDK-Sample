//
//  AppDelegate.swift
//  SalesIQiOSSDKDemo
//
//  Created by Madhusudhan Rao on 28/06/18.
//  Copyright © 2018 Madhusudhan Rao. All rights reserved.
//

import UIKit
import Mobilisten
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
        //Generate your own appkey and acceskey with your bundleidentifier
        ZohoSalesIQ.initWithAppKey("", accessKey: "")
        
        //Set user details
        ZohoSalesIQ.Visitor.setName("")
        ZohoSalesIQ.Visitor.setEmail("")
        ZohoSalesIQ.Visitor.setContactNumber("")
        ZohoSalesIQ.Visitor.addInfo("", value:"")//ZohoSalesIQ.Visitor.addInfo("User type", value:"Premium")
        ZohoSalesIQ.visitorId = "" //unique key to identify user and save conversation
       
        
        //Chat Customization
        
        ZohoSalesIQ.Chat.setVisibility(.rating, visible:true) // true/false To show/hide rating after chat ends
        ZohoSalesIQ.Chat.setVisibility(.feedback, visible: true) // To show feedback after chat ends
        ZohoSalesIQ.Chat.setVisibility(.agentPhotoOnChatIcon, visible:true) //To show operator image in chatbutton/FAB when chat is connected
        ZohoSalesIQ.Chat.setVisibility(.agent, visible:true) // To show operator image in chat transcript
        ZohoSalesIQ.Chat.setTitle("Chat with us!"); //To set chat title
        
        //set language
         ZohoSalesIQ.Chat.setLanguage(Language.french.languageCodeName())
        
        //Set theme color
        ZohoSalesIQ.Chat.setThemeColor(UIColor.green)

        //Conversation
        ZohoSalesIQ.Chat.setVisibility(.conversations, visible:true) //To show conversations
        
        //FAQ
        ZohoSalesIQ.Chat.setVisibility(.faq, visible:true) //To show conversations
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

