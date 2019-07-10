//
//  VerificationViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class VerificationViewController: XBViewController,GIDSignInUIDelegate,GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    
    @IBOutlet weak var codeTF: UITextField!
    @IBOutlet weak var verifyMe: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var verifyAgain: UIButton!
    
    public var authVerificationID:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        verifyMe.setCurveBorderButton(color: .clear, size: 20)
        codeTF.setPlaceholder(color: .white, string: "* * * * * *")
            }
    
    @IBAction func didTappedVerifyMe(_ sender: UIButton) {
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: self.authVerificationID,
            verificationCode: codeTF.text!)
         self.startActivityIndicator(withMsg: "Verifying")
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                  self.showBannerAlert_Warning(title: "Error", body: error.localizedDescription)
                return
            }
            self.stopActivityIndicator()
            // User is signed in
            let rootVC:HelloViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelloViewController") as! HelloViewController
            UIApplication.shared.keyWindow?.rootViewController = rootVC
        }
    }

    @IBAction func didTappedVerifyAgain(_ sender: UIButton) {
    }
}


