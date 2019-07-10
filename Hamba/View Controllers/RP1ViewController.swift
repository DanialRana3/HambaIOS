//
//  RP1ViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class RP1ViewController: XBViewController {

    
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var ContinueButton: UIButton!
    
    @IBOutlet weak var EmailError_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EmailView.setCurverBorderView(borderColor: Colors.bussiness_type_dark_green, size: 20)
        EmailTF.setPlaceholder(color: Colors.bussiness_type_dark_green, string: "Enter your email address")
        ContinueButton.setCurveBorderButton(color: .clear, size: 20)
    }
    func validateData()->Bool{
        
        var isValid:Bool = true
        EmailError_lbl.text = ""
       
        
        if self.EmailTF.text == "" {
            EmailError_lbl.text = "Email is empty"
            isValid = false
        }else{
            
            if !self.isValidEmail(emailAddressString: EmailTF.text!){
                EmailError_lbl.text = "Bussiness Email is InValid"
                isValid = false
            }
        }
        
        return isValid
    }
    
    @IBAction func didTappedContinue(_ sender: UIButton) {
        if !self.validateData() {
            return
        }
        self.startActivityIndicator(withMsg: "Processing")
        ApiManager.shared().forgotPassword(email: EmailTF.text!) { (status, Msg, Data) in
          
            let tempResp :forgotPassword_Response = Data as! forgotPassword_Response
            self.stopActivityIndicator()
            if(tempResp.error == "0"){
                self.showStatusBarMessage(msg: Data.message, color: UIColor.green)
                let rootVC:RP2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "RP2ViewController") as! RP2ViewController
                rootVC.userID = tempResp.data
                UIApplication.shared.keyWindow?.rootViewController = rootVC

                
            }else{
                self.showStatusBarMessage(msg: Data.message, color: UIColor.red)
            }
            
        }
    }
}
