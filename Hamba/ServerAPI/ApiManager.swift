//
//  GlobalRecources.swift
//  Baqalah
//
//  Created by Admin on 19/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import EVReflection
class ApiManager {
    
    // MARK: - Properties
    typealias CompletionHandler = (_ success:Bool,_ message:String) -> Void
    typealias CompletionHandlerWithData = (_ success:Bool, _ message:String,_ data:NSMutableData) -> Void
    
    typealias APICompletionHandler = (_ success:Bool,_ message:String,_ data:BaseResponse) -> Void
    
    var abc = ""
    private static var sharedGlobalRecources: ApiManager = {
        let GR = ApiManager()
        
        // Configuration
        // ...
        
        return GR
    }()
    
    // MARK: - Accessors
    
    class func shared() -> ApiManager {
        return sharedGlobalRecources
}
    
    func verify_codes(uID: String,email_code: String,phone_code: String,completionHandler: @escaping APICompletionHandler)
    {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        let parameters: Parameters = [
            "user_id" : uID,
            "phone_code" : phone_code,
            "email_code" : email_code
        ]
        
        request(
            ServerURL.verifyCode,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: headers
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = BaseResponse()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(BaseResponse.self)
                    ResponseObj = BaseResponse(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
        
    }
    
    func signup_BuisnessOwner(buisnessName: String,email: String,pass: String,phone: String,completionHandler: @escaping APICompletionHandler)
    {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        let parameters: Parameters = [
            "business_name" : buisnessName,
            "email" : email,
            "password" : pass,
            "phone_number" : phone,
            "type": "Business Owner"
        ]
        
        request(
            ServerURL.signUp,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: headers
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = BuisnessSignup_Response()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(BuisnessSignup_Response.self)
                    ResponseObj = BuisnessSignup_Response(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
        
    }
    
    
    func signup_BuisnessEmployee(storeName: String,email: String,pass: String,phone:String,key:String,completionHandler: @escaping APICompletionHandler)
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]

        let parameters: Parameters = [
            "store_name": storeName,
            "email": email,
            "password": pass,
            "key": key,
            "phone_number": phone,
            "type": "Business Employee"
        ]
        
        request(
            ServerURL.signUp,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: headers
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = BuisnessSignup_Response()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(BuisnessSignup_Response.self)
                    ResponseObj = BuisnessSignup_Response(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
    }
    
    func signIn_Buisness(email: String,pass: String,completionHandler: @escaping APICompletionHandler)
    {
        
        let parameters: Parameters = ["email": email,
            "password": pass]
        
        request(
            ServerURL.loginUser,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: nil
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = BuisnessSignIn_Response()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(BuisnessSignIn_Response.self)
                    ResponseObj = BuisnessSignIn_Response(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
        
    }
    
    func fetchStoreName_StoreKey(key: String,completionHandler: @escaping APICompletionHandler)
    {
//        let headers: HTTPHeaders = [
//            "Authorization": "Bearer \(AppRecources.sharedInstance.AppUser?.access_token ?? "token")",
//            "Content-Type": "application/x-www-form-urlencoded",
//            "Accept": "application/json"
//        ]

        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        let parameters: Parameters = ["key": key]
        
        request(
            ServerURL.getstorekeyinfo,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: headers
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = getStoreKeyInfo_Response()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(getStoreKeyInfo_Response.self)
                    ResponseObj = getStoreKeyInfo_Response(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
    }
    
    func forgotPassword(email: String,completionHandler: @escaping APICompletionHandler)
    {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        let parameters: Parameters = [
            "email" : email
        ]
        
        request(
            ServerURL.forgotPassword,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: headers
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = forgotPassword_Response()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(forgotPassword_Response.self)
                    ResponseObj = forgotPassword_Response(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
    }
    
    func resetPassword(userID: String,password: String,code: String,completionHandler: @escaping APICompletionHandler)
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        
        let parameters: Parameters = [
            "user_id" : userID,
            "password" : password,
            "confirm_password" : password,
            "verification_code" : code
            ]
        
        request(
            ServerURL.resetPassword,
            method :.post,
            parameters: parameters,
            encoding: URLEncoding.httpBody,
            headers: headers
            ).responseString(completionHandler: { (dataResponse: DataResponse<String>) in
                
                var ResponseObj = BaseResponse()
                print("call completed")
                print(dataResponse)
                var statusCode = false
                
                if dataResponse.response != nil {
                    statusCode = true
                }
                defer
                {
                    
                    completionHandler(statusCode,"true",ResponseObj)
                }
                if dataResponse.response != nil
                {
                    EVReflection.setBundleIdentifier(BaseResponse.self)
                    ResponseObj = BaseResponse(json: dataResponse.result.value!)
                    //                    print(ProductResponse.data.count)
                }
            })
    }
}
