//
//  verifyCodesViewController.swift
//  Hamba
//
//  Created by Macbook Pro on 01/07/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class verifyCodesViewController: XBViewController {
    
    @IBOutlet weak var emailCode_view: UIView!
    
    @IBOutlet weak var emailCode_text: UITextField!
    
    @IBOutlet weak var phCode_text: UITextField!
    @IBOutlet weak var phCode_view: UIView!
    @IBOutlet weak var emailCode_error: UILabel!
    
    @IBOutlet weak var phCode_Lbl: UILabel!
    @IBOutlet weak var verifyCode_Btn: UIButton!
    
    var userID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.uiInit()
    }
    
    func uiInit(){
        emailCode_view.setCurverBorderView(borderColor: .white, size: 20)
        emailCode_text.setPlaceholder(color: .white, string: "Email Code")
        verifyCode_Btn.setCurveBorderButton(color: .clear, size: 20)
        emailCode_error.text = ""
        
        phCode_view.setCurverBorderView(borderColor: .white, size: 20)
        phCode_text.setPlaceholder(color: .white, string: "SMS Code")
        verifyCode_Btn.setCurveBorderButton(color: .clear, size: 20)
        phCode_Lbl.text = ""
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func verify_Action(_ sender: Any) {
        if !validateData() {
            return
        }
        
        self.startActivityIndicator(withMsg: "Validating")
        
        ApiManager.shared().verify_codes(uID: self.userID, email_code: self.emailCode_text.text!, phone_code: self.emailCode_text.text!, completionHandler: { (status, msg, dataResponse) in
        
            self.stopActivityIndicator()
            
            let tempResp :BaseResponse = dataResponse as! BaseResponse
            
            if tempResp.message == "Verification Successfull!"{
                self.showStatusBarMessage(msg: tempResp.message, color: UIColor.green)
                self.performSegue(withIdentifier: "toSignup_verifCodes", sender: self)
            }else{
                self.showStatusBarMessage(msg: tempResp.message, color: UIColor.red)
            }
        })
    }
    
    func validateData()->Bool{
        
        var isValid:Bool = true
        self.emailCode_error.text = ""
        
        if self.emailCode_text.text!.count != 6 {
            emailCode_error.text = "Email Code must be 6-digit"
            isValid = false
        }
        
        if self.phCode_text.text!.count != 6 {
            phCode_Lbl.text = "Phone Code must be 6-digit"
            isValid = false
        }
        return isValid
    }
}
