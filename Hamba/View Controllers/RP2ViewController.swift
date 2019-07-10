//
//  RP2ViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class RP2ViewController: XBViewController {

    
    @IBOutlet weak var sendMeAgain: UIButton!
    @IBOutlet weak var codeView: UIView!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var NewPassView: UIView!
    @IBOutlet weak var NewPassTF: UITextField!
    @IBOutlet weak var ConfirmPassView: UIView!
    @IBOutlet weak var ConfirmPassTF: UITextField!
    @IBOutlet weak var ResetPassButton: UIButton!
    var userID = ""
    
    @IBOutlet weak var code_errorLbl: UILabel!
    
    @IBOutlet weak var password_errorLbl: UILabel!
    
    @IBOutlet weak var confirmPass_errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        codeView.setCurverBorderView(borderColor: Colors.bussiness_type_dark_green, size: 20)
        codeTF.setPlaceholder(color: Colors.bussiness_type_dark_green, string: "Enter your four digit code")
        
        NewPassView.setCurverBorderView(borderColor: Colors.bussiness_type_dark_green, size: 20)
        
        NewPassTF.setPlaceholder(color: Colors.bussiness_type_dark_green, string: "New Password")
        
        ConfirmPassView.setCurverBorderView(borderColor: Colors.bussiness_type_dark_green, size: 20)
        
        ConfirmPassTF.setPlaceholder(color: Colors.bussiness_type_dark_green, string: "Confirm Password")
        
        ResetPassButton.setCurveBorderButton(color: .clear, size: 20)
        
        self.code_errorLbl.text = ""
        self.password_errorLbl.text = ""
        self.confirmPass_errorLbl.text = ""
    }
    
    func validateData()->Bool{
        
        var isValid:Bool = true
        self.code_errorLbl.text = ""
        self.password_errorLbl.text = ""
        self.confirmPass_errorLbl.text = ""
        
        if self.codeTF.text?.count != 6{
            
            code_errorLbl.text = "Verification code must be 6 digits"
            
            isValid = false
        }else if self.NewPassTF.text!.count < 7{
            
            password_errorLbl.text = "Pasword must be greater or equal 6 digits"
            
            isValid = false
        }else if self.NewPassTF.text != self.ConfirmPassTF.text{
            
            confirmPass_errorLbl.text = "Confirm Pasword is not same"
            
            isValid = false
        }
        
        return isValid
    }
    
    @IBAction func didTappedRP(_ sender: UIButton){
        if !self.validateData() {
            return
        }
        self.startActivityIndicator(withMsg: "Resetting Password")
        ApiManager.shared().resetPassword(userID: self.userID, password: self.NewPassTF.text!, code: self.codeTF.text!, completionHandler: { (status, Msg, Data) in
            
            let tempResp :BaseResponse = Data as! BaseResponse
            self.stopActivityIndicator()
            if(tempResp.error == "0"){
                self.showBannerAlert_Success(title: "Password Reset", body: tempResp.message)
                let rootVC:RP3ViewController = self.storyboard?.instantiateViewController(withIdentifier: "RP3ViewController") as! RP3ViewController
                        UIApplication.shared.keyWindow?.rootViewController = rootVC
                }else{
                self.showBannerAlert_Error(title: "Password Reset", body: tempResp.message)
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
