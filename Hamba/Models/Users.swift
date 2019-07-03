//
//  Users.swift
//  MashoorApp
//
//  Created by Hexagonal3 on 23/04/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import Foundation

class Users {
    
    var email: String?
    var bussinessName: String?
    var phone: String?
    var password: String?
    var countryName: String?
    var cityName: String?
    var bussinessType: String?

    
    init(email : String , bussinessName : String , phone: String, password: String,countryName: String,cityName: String,bussinessType: String) {
        self.email = email
        self.bussinessName = bussinessName
        self.phone = phone
        self.password = password
        self.countryName = countryName
        self.cityName = cityName
        self.bussinessType = bussinessType
    }
}


class Users2 {
    
    var shopName: String?
    var presharedKey: String?
    var email: String?
    var password: String?
    
    
    init(shopName : String , presharedKey : String , email: String, password: String) {
        self.shopName = shopName
        self.presharedKey = presharedKey
        self.email = email
        self.password = password
    }
}
