//
//  BOSignUpViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 07/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class BOSignUpViewController: XBViewController{
    
    @IBOutlet weak var BussinessNameView: UIView!
    @IBOutlet weak var BussinessNameTF: UITextField!

    @IBOutlet weak var BussinessEmailView: UIView!
    @IBOutlet weak var BussinessEmailTF: UITextField!

    @IBOutlet weak var BussinessNumberView: UIView!
    @IBOutlet weak var BussinessNumberTF: UITextField!

    @IBOutlet weak var BussinessCityView: UIView!
    @IBOutlet weak var BussinessCityImage: UIImageView!
    @IBOutlet weak var BussinessCity: UIButton!
    @IBOutlet weak var BussinessCityTF: UITextField!
    
    
    @IBOutlet weak var BussinessPasswordView: UIView!
    @IBOutlet weak var BussinessPasswordTF: UITextField!

    @IBOutlet weak var Signup: UIButton!
    
    @IBOutlet weak var buisnessName_error: UILabel!
    @IBOutlet weak var buisnessNumber_error: UILabel!
    
    @IBOutlet weak var buisnessEmail_error: UILabel!
    
    @IBOutlet weak var city_error: UILabel!
    @IBOutlet weak var password_error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     self.uiInit()
    }
    
    func uiInit(){
        
        //set curve views
        BussinessNameView.setCurverBorderView(borderColor: .white, size: 20)
        BussinessEmailView.setCurverBorderView(borderColor: .white, size: 20)
        BussinessNumberView.setCurverBorderView(borderColor: .white, size: 20)
        BussinessCityView.setCurverBorderView(borderColor: .white, size: 20)
        BussinessPasswordView.setCurverBorderView(borderColor: .white, size: 20)
        
        //set placeholders
        BussinessNameTF.setPlaceholder(color: .white, string: "Bussiness Name")
        BussinessEmailTF.setPlaceholder(color: .white, string: "Bussiness@abc.com")
        BussinessNumberTF.setPlaceholder(color: .white, string: "+91 123 134 444")
        BussinessCityTF.setPlaceholder(color: .white, string: "Enter your city name")
        BussinessPasswordTF.setPlaceholder(color: .white, string: "********")
        
        //set curve button
        Signup.setCurveBorderButton(color: .clear, size: 20)
        
        self.buisnessName_error.text = ""
        self.buisnessEmail_error.text = ""
        self.buisnessNumber_error.text = ""
        self.city_error.text = ""
        self.password_error.text = ""
    }
    
    @IBAction func didTappedCity(_ sender: UIButton) {
        
    }
    func validateData()->Bool{
        
        var isValid:Bool = true
        buisnessName_error.text = ""
        buisnessEmail_error.text = ""
        self.buisnessNumber_error.text = ""
        city_error.text = ""
        password_error.text = ""
        
        if self.BussinessNameTF.text == "" {
            buisnessName_error.text = "Bussiness name is empty"
            isValid = false
        }
        if self.BussinessEmailTF.text == "" {
            buisnessEmail_error.text = "Bussiness Email is empty"
            isValid = false
        }else{
           
            if !self.isValidEmail(emailAddressString: BussinessEmailTF.text!){
                buisnessEmail_error.text = "Bussiness Email is InValid"
                isValid = false
            }
        }
        
        if self.BussinessNumberTF.text == "" {
            buisnessNumber_error.text = "Bussiness Number is empty"
            isValid = false
        }
            
        
        if self.BussinessCityTF.text == "" {
            city_error.text = "City is empty"
                isValid = false
        }
        
        if self.BussinessPasswordTF.text == "" {
            password_error.text = "Password is empty"
                isValid = false
        }
        
        return isValid
    }
    
    
    @IBAction func didTappedSignUp(_ sender: UIButton) {
        if !validateData() {
            return
        }
        self.startActivityIndicator(withMsg: "Registering")
       
        ApiManager.shared().signup_BuisnessOwner(buisnessName: self.BussinessNameTF.text!, email: self.BussinessEmailTF.text!, pass: self.BussinessPasswordTF.text!, phone: self.BussinessNumberTF.text!, completionHandler: { (status, message, data) in
            print(message)
            self.stopActivityIndicator()
            
             let tempResp :BuisnessSignup_Response = data as! BuisnessSignup_Response
            if(tempResp.message == " User Created Successfully !"){
                
                self.showStatusBarMessage(msg: tempResp.message, color: UIColor.green)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "verifyCodesViewController") as! verifyCodesViewController
                vc.userID = tempResp.data.id
                self.present(vc, animated: true, completion: nil)
//                self.performSegue(withIdentifier: "toSignup_verify", sender: self)
                
            }else{
                self.showStatusBarMessage(msg: tempResp.message, color: UIColor.red)
                
            }
        })
    }
    

 
}
