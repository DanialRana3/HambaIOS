//
//  iLoginViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 07/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit
import FlagPhoneNumber
import FacebookLogin
import FacebookCore
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn
import Firebase

class iLoginViewController: XBViewController,GIDSignInUIDelegate,GIDSignInDelegate{
   
    
    @IBOutlet weak var PhoneView: UIView!
    @IBOutlet weak var PhoneTF: FPNTextField!
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var FacebookView: UIView!
    @IBOutlet weak var FacebookButton: UIButton!
    @IBOutlet weak var InstagramView: UIView!
    @IBOutlet weak var InstagramButton: UIButton!
    @IBOutlet weak var GoogleView: UIView!
    @IBOutlet weak var GoogleButton: UIButton!
    
    //Instagram Gradient Colors
    
    //Phone TF
    var dialCode = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        for family in UIFont.familyNames {
            print("\(family)")
            
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }


        // Do any additional setup after loading the view.
        PhoneView.setCurverBorderView(borderColor: .white, size: 20)
        SignInButton.setCurveBorderButton(color: .clear, size: 20)
        FacebookView.setCurverBorderView(borderColor: .clear, size: 20)
        InstagramView.setCurverBorderView(borderColor: .clear, size: 20)
        GoogleView.setCurverBorderView(borderColor: .clear, size: 20)

        //set Gradient Color
        InstagramView.setGradientBackgroundV(colorOne: Colors.instagram_lightPurple, colorTwo: Colors.instagram_lightRed)
        
        //Phone TF
//        let flagButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 280, height: 40))
//        flagButton.backgroundColor = .red
        
        PhoneTF.flagButtonEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        PhoneTF.font = UIFont(name: "duCoHeadline16-Regular", size: 17)
        PhoneTF.textColor = .white
        
        PhoneTF.flagSize = CGSize(width: 25, height: 25)
//        PhoneTF.setFlag(for: .PK)
        PhoneTF.delegate = self
        PhoneTF.parentViewController = self // or from @IBOutlet
        PhoneTF.setPlaceholder(color: .white, string: "Phone number")

        self.dialCode = PhoneTF.selectedCountry!.phoneCode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    

    @IBAction func didTappedSignIn(_ sender: UIButton) {
// self.startActivityIndicator(withMsg: "Verifying")
        let phoneNumb = "\(self.dialCode)\(self.PhoneTF.text ?? "+971")"
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumb, uiDelegate: nil) { (verificationID, error) in
            self.stopActivityIndicator()
            if let error = error {
                self.showBannerAlert_Warning(title: "Error", body: error.localizedDescription)
                return
            }
            // Sign in using the verificationID and the code sent to the user
            // ...
            self.showStatusBarMessage(msg: "Message Sent", color: UIColor.orange)
            let rootVC:VerificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "VerificationViewController") as! VerificationViewController
            rootVC.authVerificationID = verificationID
                    UIApplication.shared.keyWindow?.rootViewController = rootVC
        }
        
  
    }
    
    
    func signin_Fb(){
        
        
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        let token = AccessToken.current as AccessToken?
                        
                        self.getFBUserData()
                        
                        
                        //fbLoginManager.logOut()
                    }
                }
            }
        }
        
    }
    
    func getFBUserData()
    {
        if((AccessToken.current) != nil)
        {
            print(AccessToken.current)
            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil)
                {
                    var dict = result as! [String : AnyObject]
                    if dict["email"] != nil {
                        
//                        self.signinWith(email: dict["email"] as! String, name: dict["first_name"] as! String, provider: "Facebook")
                    }else{
//                        self.signinWith(email: dict["id"] as! String, name: dict["first_name"] as! String, provider: "Facebook")
                    }
                    
                    
                    let rootVC:HelloViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelloViewController") as! HelloViewController
                    UIApplication.shared.keyWindow?.rootViewController = rootVC
                    
                }
            })
        }
    }
    
    func signin_Google(){
        
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: (authentication.idToken)!, accessToken: (authentication.accessToken)!)
        // When user is signed in
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                return
            }
            
            let rootVC:HelloViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelloViewController") as! HelloViewController
            UIApplication.shared.keyWindow?.rootViewController = rootVC
//            if user?.email != nil {
//                
//                self.signinWith(email: user?.email as! String, name: user?.displayName as! String, provider: "Google")
//            }else{
//                self.signinWith(email: user?.phoneNumber as! String, name: user?.displayName as! String, provider: "Google")
//            }
            
        })
    }
    // Start Google OAuth2 Authentication

    func sign(_ signIn: GIDSignIn?, present viewController: UIViewController?) {
        
        // Showing OAuth2 authentication window
        if let aController = viewController {
            present(aController, animated: true) {() -> Void in }
        }
    }
    // After Google OAuth2 authentication
    func sign(_ signIn: GIDSignIn?, dismiss viewController: UIViewController?) {
        // Close OAuth2 authentication window
        dismiss(animated: true) {() -> Void in }
    }
    @IBAction func didTappedFb(_ sender: UIButton) {
        
        self.signin_Fb()
        
    }
    
    @IBAction func didTappedInstagram(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedGoogle(_ sender: UIButton) {
        self.signin_Google()
    }
    
   
}

extension iLoginViewController: FPNTextFieldDelegate {
    
    public func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code) // Output "France", "+33", "FR"
        self.dialCode = dialCode
        self.PhoneTF.text = ""
    }
    
    public func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            // Do something...
            textField.getFormattedPhoneNumber(format: .E164)           // Output "+33600000001"
            textField.getFormattedPhoneNumber(format: .International) // Output "+33 6 00 00 00 01"
            textField.getFormattedPhoneNumber(format: .National)   // Output "06 00 00 00 01"
            textField.getFormattedPhoneNumber(format: .RFC3966)        // Output "tel:+33-6-00-00-00-01"
            textField.getRawPhoneNumber()                               // Output "600000001"
            
        } else {
            // Do something...
            //            self.showAlert(strMessage: "Type complete phone number")
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength = 0
        if(dialCode == "+971" || dialCode == "+44"){
            
            maxLength = 11
            
        }else{
            maxLength = (textField.placeholder?.count)!
            
        }
        
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
}

}
