//
//  storeKeyViewController.swift
//  Hamba
//
//  Created by Macbook Pro on 27/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class storeKeyViewController: XBViewController {

    @IBOutlet weak var storeKeyView: UIView!
    @IBOutlet weak var storeKey_TF: UITextField!
    
    @IBOutlet weak var verify_Btn: UIButton!
    
    @IBOutlet weak var keyError_lbl: UILabel!
    
    var storeResp :getStoreKeyInfo_Model!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.uiInit()
    }
    
    @IBAction func verifyBtn_Action(_ sender: Any) {
        if !validateData() {
            return
        }
        
        self.startActivityIndicator(withMsg: "Fetching Data")
        
        ApiManager.shared().fetchStoreName_StoreKey(key: self.storeKey_TF.text!) { (status, Msg, data) in
            
            self.stopActivityIndicator()
            
            let tempResp :getStoreKeyInfo_Response = data as! getStoreKeyInfo_Response
            
            if tempResp.error == "0"{
                self.storeResp = tempResp.data
                self.showStatusBarMessage(msg: "Store key verified", color: UIColor.green)
                self.performSegue(withIdentifier: "toBESignup_keyVerify", sender: self)
            }else{
                 self.showStatusBarMessage(msg: tempResp.message, color: UIColor.red)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toBESignup_keyVerify") {
            let vc = segue.destination as! BESingUpViewController
            
            vc.storeName = self.storeResp.store_name
            vc.BO_id = self.storeResp.business_owner_id
            vc.storeKey = self.storeKey_TF.text
        }
    }
    
    func validateData()->Bool{
        
        var isValid:Bool = true
        keyError_lbl.text = ""
        
        if self.storeKey_TF.text == "" {
            keyError_lbl.text = "Pre-Shared Key is empty"
            isValid = false
        }
        
        return isValid
    }
    
    func uiInit(){
        storeKeyView.setCurverBorderView(borderColor: .white, size: 20)
        storeKey_TF.setPlaceholder(color: .white, string: "Pre Shared Key")
        verify_Btn.setCurveBorderButton(color: .clear, size: 20)
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
