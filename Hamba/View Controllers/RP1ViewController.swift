//
//  RP1ViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class RP1ViewController: UIViewController {

    
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var EmailTF: UITextField!
    @IBOutlet weak var ContinueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        EmailView.setCurverBorderView(borderColor: Colors.bussiness_type_dark_green, size: 20)
        EmailTF.setPlaceholder(color: Colors.bussiness_type_dark_green, string: "Enter your email address")
        ContinueButton.setCurveBorderButton(color: .clear, size: 20)
    }
    
    
    
    @IBAction func didTappedContinue(_ sender: UIButton) {
        
        let rootVC:RP2ViewController = self.storyboard?.instantiateViewController(withIdentifier: "RP2ViewController") as! RP2ViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC

        
    }
    
   

}
