//
//  RP3ViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class RP3ViewController: UIViewController {

    
    @IBOutlet weak var LoginButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LoginButton.setCurveBorderButton(color: .clear, size: 20)
        
    }
    

    @IBAction func didTappedLogin(_ sender: UIButton) {
        
        let rootVC:BOSignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "BOSignUpViewController") as! BOSignUpViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC

    }
    
}
