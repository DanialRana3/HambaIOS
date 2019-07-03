//
//  BOESingInViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class BOESingInViewController: XBViewController {

    
    @IBOutlet weak var BussinessEmailView: UIView!
    @IBOutlet weak var BussinessEmailTF: UITextField!
    @IBOutlet weak var BussinessEmailLabel: UILabel!

    
    @IBOutlet weak var BussinessPasswordView: UIView!
    @IBOutlet weak var BussinessPasswordTF: UITextField!
    @IBOutlet weak var BussinessPasswordLabel: UILabel!

    @IBOutlet weak var ForgetPassword: UIButton!

    @IBOutlet weak var SignIn: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.uiInit()
    }
    func uiInit(){
        BussinessEmailView.setCurverBorderView(borderColor: .white, size: 20)
        BussinessPasswordView.setCurverBorderView(borderColor: .white, size: 20)
        
        //set placeholders
        BussinessEmailTF.setPlaceholder(color: .white, string: "Bussiness@abc.com")
        BussinessPasswordTF.setPlaceholder(color: .white, string: "********")
        
        SignIn.setCurveBorderButton(color: .clear, size: 20)
        
        self.BussinessEmailLabel.text = ""
        self.BussinessPasswordLabel.text = ""
    }
    
    
    @IBAction func didTappedForgetPassword(_ sender: UIButton) {
        
        let rootVC:RP1ViewController = self.storyboard?.instantiateViewController(withIdentifier: "RP1ViewController") as! RP1ViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC

    }
    
    func validateData()->Bool{
        
        
        var isValid:Bool = true
        self.BussinessEmailLabel.text = ""
        self.BussinessPasswordLabel.text = ""
       
        if self.BussinessPasswordTF.text == "" {
            BussinessPasswordLabel.text = "Password is empty"
            isValid = false
        }
        
        
        if self.BussinessEmailTF.text == "" {
            BussinessEmailLabel.text = "Bussiness Email is empty"
            isValid = false
        }else{
            if !self.isValidEmail(emailAddressString: BussinessEmailTF.text!){
                BussinessEmailLabel.text = "Bussiness Email is InValid"
                isValid = false
            }
       }
        
        return isValid
    }
    
    @IBAction func didTapped_LoginButton(_ sender: UIButton) {
        if !validateData() {
            return
        }
        
        self.startActivityIndicator(withMsg: "Processing")
        ApiManager.shared().signIn_Buisness(email: self.BussinessEmailTF.text!, pass: self.BussinessPasswordTF.text!) { (status, message, data) in
            print(message)
            self.stopActivityIndicator()
            
            let tempResp :BuisnessSignIn_Response = data as! BuisnessSignIn_Response
            if(tempResp.message == "Login Successfully !" || tempResp.access_token != nil){
                self.showStatusBarMessage(msg: tempResp.message, color: UIColor.green)
                self.performSegue(withIdentifier: "toProfile_signin", sender: self)
            }else{
                self.showStatusBarMessage(msg: "Failed : Email/Password Invalid", color: UIColor.red)
            }
        }
    }

}
