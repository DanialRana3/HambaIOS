//
//  BESingUpViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 07/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit
import Firebase

class BESingUpViewController: XBViewController {

    @IBOutlet weak var usernameView: UIView!
    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var phone_TFView: UIView!
    @IBOutlet weak var phone_TF: UITextField!
    
    @IBOutlet weak var shopNameView: UIView!
    @IBOutlet weak var shopName: UITextField!

    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var signupView: UIView!
    @IBOutlet weak var signup: UIButton!


    
    @IBOutlet weak var shopNameValidate: UILabel!
    @IBOutlet weak var presahredKeyValidate: UILabel!
    @IBOutlet weak var emailValidate: UILabel!
    @IBOutlet weak var passwordValidate: UILabel!
    
    var storeName:String!
    var storeKey:String!
    var BO_id: String!
    

////
////    var users: Users?
////    var handle: AuthStateDidChangeListenerHandle?
////    var ref: DatabaseReference!
//    var user = Auth.auth().currentUser
    var count: Int = 0

    var shopTimer:Timer!
    var phone_TFTimer:Timer!
    var emailTimer:Timer!
    var passwordTimer:Timer!

    var shopLimit: Int = 0
    var phone_TFLimit: Int = 0
    var emailLimit: Int = 0
    var passwordLimit: Int = 0
    var iconClick : Bool! //eyeIcon st#1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.uiInit()
    }
    func uiInit(){
            usernameView.setCurverBorderView(borderColor: .white, size: 20)
            phone_TFView.setCurverBorderView(borderColor: .white, size: 20)
            shopNameView.setCurverBorderView(borderColor: .white, size: 20)
            passwordView.setCurverBorderView(borderColor: .white, size: 20)
        
            signup.setCurveBorderButton(color: .clear, size: 20)
        
            username.setPlaceholder(color: .white, string: "Email / User Name")
            phone_TF.setPlaceholder(color: .white, string: "Phone")
            shopName.text = self.storeName
            shopName.isUserInteractionEnabled = false
            password.setPlaceholder(color: .white, string: "*******")
        
        shopNameValidate.text = ""
        presahredKeyValidate.text = ""
        self.emailValidate.text = ""
        passwordValidate.text = ""
        self.addRightImagetoTextfield(image: UIImage(named: "eye-closed2")!)
    }
    
    func addRightImagetoTextfield(image: UIImage){
        
        let eyeButton  = UIButton(type: .custom)
        eyeButton.tintColor = .white
        eyeButton.setImage(image, for: .normal)
        eyeButton.frame = CGRect(x:0, y:0, width:20, height:20)
        eyeButton.addTarget(self, action: #selector(self.showhide), for: .touchUpInside)//Target
        password.rightViewMode = .always
        password.rightView = eyeButton
    }

    //eyeIcon st#4
    @objc func showhide(){

        let closeEyeIcon = UIImage(named: "eye-closed2")
        let openEyeIcon = UIImage(named: "eye-open2")

        if(iconClick == true) {
            password.isSecureTextEntry = false
            //close
            addRightImagetoTextfield(image: openEyeIcon!)
            iconClick = false
        } else {
            password.isSecureTextEntry = true
            
            //open
            addRightImagetoTextfield(image: closeEyeIcon!)
            iconClick = true
        }
    }
    
    func addRightInfoButtonToTextfield(){

        let infoButton  = UIButton(type: .infoDark)
        infoButton.tintColor = .white
        //        eyeButton.setImage(image, for: .normal)bplist00’
    }
    
    func validateData()->Bool{
     
        var isValid:Bool = true
        self.shopNameValidate.text = ""
        self.presahredKeyValidate.text = ""
        self.emailValidate.text = ""
        self.passwordValidate.text = ""
        
        if self.shopName.text == "" {
            shopNameValidate.text = "Store name is empty"
            isValid = false
        }
        
        if self.phone_TF.text == "" {
            presahredKeyValidate.text = "Bussiness Phone Key is empty"
            isValid = false
        }
        
        if self.username.text == "" {
            emailValidate.text = "Bussiness Email is empty"
            isValid = false
        }else{
            if !self.isValidEmail(emailAddressString: username.text!){
                emailValidate.text = "Bussiness Email is InValid"
                isValid = false
            }
        }
        
        if self.password.text == "" {
            passwordValidate.text = "Password is empty"
            isValid = false
        }
        
        return isValid
    }

    @IBAction func signup_Action(_ sender: Any) {
         if !validateData() {
            return
        }
        
        self.startActivityIndicator(withMsg: "Registering")
        
        ApiManager.shared().signup_BuisnessEmployee(storeName: self.shopName.text!, email: self.username.text!, pass: self.password.text!, phone: self.phone_TF.text!, key: self.storeKey) { (status, message, data) in
            print(message)
            let tempResp :BuisnessSignup_Response = data as! BuisnessSignup_Response
            self.stopActivityIndicator()
            if(tempResp.error == "0"){
                self.showStatusBarMessage(msg: data.message, color: UIColor.green)
                self.performSegue(withIdentifier: "toSignin_BESegue", sender: self)

            }else{
                self.showStatusBarMessage(msg: data.message, color: UIColor.red)
            }
        }
    }
}
