//
//  MainViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 06/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var shopView: UIView!
    @IBOutlet weak var customerView: UIView!
    @IBOutlet weak var guestView: UIView!
    @IBOutlet weak var guest: UIButton!
    
    @IBOutlet weak var shop: UIButton!
    @IBOutlet weak var customer: UIButton!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.showAlert(strMessage: "This is testing alert")
        
        // Do any additional setup after loading the view.
        //        self.makeCurveButton(uibutton: shop)
        //        self.makeCurveButton(uibutton: customer)
        //        self.makeCurveButton(uibutton: guest)
        self.makeBorderWhiteBox(uiview: shopView)
        self.makeBorderWhiteBox(uiview: customerView)
        self.makeUnderlinedText()
        self.loader.isHidden = true
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        print("fontended")
    }
    
    func makeUnderlinedText(){
        
        //set underline with terms and conditions
        let labelString = "Continue As a Guest"
        let textColor: UIColor = UIColor(red:0.00, green:0.40, blue:0.38, alpha:1.0)
        let underLineColor: UIColor = UIColor(red:0.00, green:0.40, blue:0.38, alpha:1.0)
        
        let underLineStyle = NSUnderlineStyle.single.rawValue
        
        let labelAtributes:[NSAttributedString.Key : Any]  = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.underlineStyle: underLineStyle,
            NSAttributedString.Key.underlineColor: underLineColor
        ]
        
        var underlineAttributedString = NSAttributedString(string: labelString,
                                                           attributes: labelAtributes)
     
        underlineAttributedString = NSAttributedString(string: labelString,
                                                       attributes: labelAtributes)
        self.guest.setAttributedTitle(underlineAttributedString, for: .normal)
        //        self.newAccount.attributedText = underlineAttributedString
        
    }
    
    func makeCurveButton(uibutton: UIButton){
        
        let path = UIBezierPath(roundedRect:uibutton.bounds,byRoundingCorners:[.topRight, .bottomRight, .topLeft , .bottomLeft],cornerRadii: CGSize(width: 15, height:  15))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        uibutton.layer.mask = maskLayer
    }
    
    func makeBorderWhiteBox(uiview: UIView){
        
        let path = UIBezierPath(roundedRect:uiview.bounds,byRoundingCorners:[.topRight, .bottomRight, .topLeft , .bottomLeft],cornerRadii: CGSize(width: 10, height:  10))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        uiview.layer.mask = maskLayer
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path // Reuse the Bezier path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor(red:0.74, green:0.91, blue:0.89, alpha:1.0).cgColor
        borderLayer.lineWidth = 4
        borderLayer.frame = uiview.bounds
        uiview.layer.addSublayer(borderLayer)
    }
    
    
    @IBAction func didTappedShop(_ sender: Any) {
        
        ShopTempData.sharedInstance.loginValue = "owner"
        
        //goto Shop Splash Screen
        let rootVC:OptionSignupViewController = self.storyboard?.instantiateViewController(withIdentifier: "OptionSignupViewController") as! OptionSignupViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC
        
    }
    
    @IBAction func didTappedCustomer(_ sender: Any) {
        
        //goto Customer Login Screen
        ShopTempData.sharedInstance.loginValue = "customer"
        
        let rootVC:iLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "iLoginViewController") as! iLoginViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
    
    @IBAction func didTappedGuest(_ sender: Any) {
        let alert = UIAlertController(title: "Hamba", message: "Wants to Sign in as Guest?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue", style: .default) { (UIAlertAction) in
            
            
                let rootVC:HelloViewController = self.storyboard?.instantiateViewController(withIdentifier: "HelloViewController") as! HelloViewController
                UIApplication.shared.keyWindow?.rootViewController = rootVC

            }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }

}

class ShopTempData {
    static var sharedInstance = ShopTempData()
    var loginValue : String?
}
