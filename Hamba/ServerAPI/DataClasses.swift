//
//  DataClasses.swift
//  Hamba
//
//  Created by Macbook Pro on 20/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit
import CoreData
import EVReflection


// MARK: - BaseResponse
class BaseResponse:EVObject{
  
    var error : String!
    var message : String!

}

// MARK: - UserData
class UserData:EVObject{
  
    var businessName : String!
    var email : String!
    var phone_number : String!
    var id : String!
    var key : String!
    var type : String!
    var store_name : String!
    

}

// MARK: - BuisnessOwner
class BuisnessSignup_Response:BaseResponse{

        var data : UserData!
}

class BuisnessSignIn_Response:BaseResponse{
    
    var access_token : String!
    var data : UserData!
}

class forgotPassword_Response:BaseResponse{
    
    var data : String!
}
class getStoreKeyInfo_Response:BaseResponse{
    var data : getStoreKeyInfo_Model!
}
class getStoreKeyInfo_Model:EVObject{
    var business_owner_id : String!
    var store_name : String!
}



