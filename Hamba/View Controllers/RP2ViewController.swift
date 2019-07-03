//
//  RP2ViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class RP2ViewController: UIViewController {

    
    @IBOutlet weak var sendMeAgain: UIButton!
    @IBOutlet weak var codeView: UIView!
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var NewPassView: UIView!
    @IBOutlet weak var NewPassTF: UITextField!
    @IBOutlet weak var ConfirmPassView: UIView!
    @IBOutlet weak var ConfirmPassTF: UITextField!
    @IBOutlet weak var ResetPassButton: UIButton!
    
    
    
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

    }
    

    @IBAction func didTappedRP(_ sender: UIButton) {
        
        let rootVC:RP3ViewController = self.storyboard?.instantiateViewController(withIdentifier: "RP3ViewController") as! RP3ViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC

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
