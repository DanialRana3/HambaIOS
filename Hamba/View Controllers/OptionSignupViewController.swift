//
//  OptionSignupViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 06/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class OptionSignupViewController: UIViewController {

    //bussiness owner
    @IBOutlet weak var BussinessOwnerView: UIView!
    @IBOutlet weak var BussinessOwnerImage: UIImageView!
    @IBOutlet weak var BussinessOwnerLabel: UILabel!
    @IBOutlet weak var BussinessOwnerButton: UIButton!
    

    //boAlreadyHaveAnAccount
    @IBOutlet weak var BOAHAView: UIView!
    @IBOutlet weak var BOAHALabel: UILabel!
    @IBOutlet weak var BOAHASeperator: UIView!
    @IBOutlet weak var BOAHAButton: UIButton!

    @IBOutlet weak var BOAHAHeight: NSLayoutConstraint!

    //boNewuser
    @IBOutlet weak var BONUView: UIView!
    @IBOutlet weak var BONULabel: UILabel!
    @IBOutlet weak var BONUButton: UIButton!
    @IBOutlet weak var BONUSeperator: UIView!
    @IBOutlet weak var BONUHeight: NSLayoutConstraint!

    //bussiness employee
    @IBOutlet weak var BussinessEmployeeView: UIView!
    @IBOutlet weak var BussinessEmployeeImage: UIImageView!
    @IBOutlet weak var BussinessEmployeeLabel: UILabel!
    @IBOutlet weak var BussinessEmployeeButton: UIButton!

    //beAlreadyHaveAnAccount
    @IBOutlet weak var BEAHAView: UIView!
    @IBOutlet weak var BEAHALabel: UILabel!
    @IBOutlet weak var BEAHAButton: UIButton!
    @IBOutlet weak var BEAHASeperator: UIView!
    @IBOutlet weak var BEAHAHeight: NSLayoutConstraint!

    //beNewuser
    @IBOutlet weak var BENUView: UIView!
    @IBOutlet weak var BENULabel: UILabel!
    @IBOutlet weak var BENUButton: UIButton!
    @IBOutlet weak var BENUSeperator: UIView!
    @IBOutlet weak var BENUHeight: NSLayoutConstraint!

    var BOBool: Bool = true
    var BEBool: Bool = true
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        BussinessOwnerView.setCurverBorderView(borderColor: .clear, size: 20)
        BussinessEmployeeView.setCurverBorderView(borderColor: .clear, size: 20)
        
        
        //set height for constraint
        BOAHAHeight.constant = 0
        BONUHeight.constant = 0
        BEAHAHeight.constant = 0
        BENUHeight.constant = 0
        
        self.BENUSeperator.isHidden = true
        self.BEAHASeperator.isHidden = true
        self.BOAHASeperator.isHidden = true
        self.BONUSeperator.isHidden = true
    }
    
    
    @IBAction func didTappedBussinessOwner(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            if(self.BOBool){
            
                self.BOBool = false
                self.BEBool = true

                //set height for constraint
                self.BOAHAHeight.constant = 40
                self.BONUHeight.constant = 40
                self.BussinessOwnerImage.image = UIImage(named: "up-white")
                self.BussinessEmployeeImage.image = UIImage(named: "down-white")
                self.BEAHAHeight.constant = 0
                self.BENUHeight.constant = 0
                self.BENUSeperator.isHidden = true
                self.BEAHASeperator.isHidden = true
                self.BOAHASeperator.isHidden = false
                self.BONUSeperator.isHidden = false
                
                self.view.layoutIfNeeded()
                
            }else{
                
                self.BOBool = true

                //set height for constraint
                self.BussinessOwnerImage.image = UIImage(named: "down-white")
                self.BussinessEmployeeImage.image = UIImage(named: "down-white")
                self.BOAHAHeight.constant = 0
                self.BONUHeight.constant = 0
                self.BEAHAHeight.constant = 0
                self.BENUHeight.constant = 0
                self.BENUSeperator.isHidden = true
                self.BEAHASeperator.isHidden = true
                self.BOAHASeperator.isHidden = true
                self.BONUSeperator.isHidden = true
                self.view.layoutIfNeeded()
            }
            
        }) { (true) in
        }
    }
    
    @IBAction func didTappedBussinessEmployee(_ sender: UIButton) {
    
        UIView.animate(withDuration: 0.5, animations: {
            
            if(self.BEBool){
                
                self.BEBool = false
                self.BOBool = true

                //set height for constraint
                self.BOAHAHeight.constant = 0
                self.BONUHeight.constant = 0
                self.BEAHAHeight.constant = 40
                self.BENUHeight.constant = 40
                self.BussinessEmployeeImage.image = UIImage(named: "up-white")
                self.BussinessOwnerImage.image = UIImage(named: "down-white")
                self.BENUSeperator.isHidden = false
                self.BEAHASeperator.isHidden = false
                self.BOAHASeperator.isHidden = true
                self.BONUSeperator.isHidden = true
                
                self.view.layoutIfNeeded()
                
            }else{
                
                self.BEBool = true
                
                //set height for constraint
                self.BOAHAHeight.constant = 0
                self.BONUHeight.constant = 0
                self.BEAHAHeight.constant = 0
                self.BENUHeight.constant = 0
                self.BussinessOwnerImage.image = UIImage(named: "down-white")
                self.BussinessEmployeeImage.image = UIImage(named: "down-white")
                
                self.BENUSeperator.isHidden = true
                self.BEAHASeperator.isHidden = true
                self.BOAHASeperator.isHidden = true
                self.BONUSeperator.isHidden = true
                
                self.view.layoutIfNeeded()
            }

        }) { (true) in
        }
    
    }
    
    @IBAction func didTappedBOAHA(_ sender: UIButton) {
        
        let rootVC:BOESingInViewController = self.storyboard?.instantiateViewController(withIdentifier: "BOESingInViewController") as! BOESingInViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
    
    @IBAction func didTappedBONU(_ sender: UIButton) {
        
        let rootVC:BOSignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "BOSignUpViewController") as! BOSignUpViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
    
    @IBAction func didTappedBEAHA(_ sender: UIButton) {
        
        let rootVC:BOESingInViewController = self.storyboard?.instantiateViewController(withIdentifier: "BOESingInViewController") as! BOESingInViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }

    @IBAction func didTappedBENU(_ sender: UIButton) {
        
        let rootVC:storeKeyViewController = self.storyboard?.instantiateViewController(withIdentifier: "storeKeyViewController") as! storeKeyViewController
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
}
