//
//  ZSIQEntityObject.swift
//  Zylker
//
//  Created by gopi-6625 on 11/02/19.
//  Copyright © 2019 zoho. All rights reserved.
//

import Foundation

class ZSIQEntityObject {
    
    let entityImage : String
    let entityTitle : String
    let entityAddress : String
    let entityPrice : String
    let entityRoomsAvailable : String
    let entityStatus : String
    let entityParkingAvailable : String
    let entitySqftArea : String
    let entityPossDate : String
    let entityDescription : String
    let entityProjectSize : String
    let entityProjectArea : String
    let entityLaunchDate : String
    let entityCommute : String
    let entityEssentials : String
    let entityLifestyle : String

    init(img : String, title : String, subTitle : String, price : String, roomsAvailable : String, status : String, parkingAvailable : String, buildArea : String, possDate : String, desc : String, projectSize : String, projectArea : String, launchDate : String, commute : String, essentials : String, lifeStyle : String) {
        
        entityImage = img
        entityTitle = title
        entityAddress = subTitle
        entityPrice = price
        entityRoomsAvailable = roomsAvailable
        entityStatus = status
        entityParkingAvailable = parkingAvailable
        entitySqftArea = buildArea
        entityPossDate = possDate
        entityDescription = desc
        entityProjectSize = projectSize
        entityProjectArea = projectArea
        entityLaunchDate = launchDate
        entityCommute = commute
        entityEssentials = essentials
        entityLifestyle = lifeStyle
    }
    
    convenience init(entityDict : [String:Any]) {
        
        let itemImage = entityDict["image"] as! String
        let itemTitle = entityDict["name"] as! String
        let itemAddress = entityDict["address"] as! String
        let itemPrice = entityDict["price"] as! String
        let itemRoomsAvailable = entityDict["available rooms"] as! String
        let itemStatus = entityDict["home status"] as! String
        let itemParkingAvailable = entityDict["parking available"] as! String
        let itemSqftArea = entityDict["sqft area"] as! String
        let itemPossDate = entityDict["poss date"] as! String
        let itemDesc = entityDict["home desc"] as! String
        let itemProjectSize = entityDict["project size"] as! String
        let itemProjectArea = entityDict["project area"] as! String
        let itemLaunchDate = entityDict["launch date"] as! String
        let itemCommute = entityDict["commute"] as! String
        let itemEssentials = entityDict["essentials"] as! String
        let itemLifestyle = entityDict["life style"] as! String

        self.init(img: itemImage, title: itemTitle, subTitle: itemAddress, price: itemPrice, roomsAvailable: itemRoomsAvailable, status: itemStatus, parkingAvailable: itemParkingAvailable, buildArea: itemSqftArea, possDate: itemPossDate, desc: itemDesc, projectSize: itemProjectSize, projectArea: itemProjectArea, launchDate: itemLaunchDate, commute: itemCommute, essentials: itemEssentials, lifeStyle: itemLifestyle)
    }
}
