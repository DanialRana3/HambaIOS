//
//  ProfileViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var FullNameView: UIView!
    @IBOutlet weak var FullNameTF: UITextField!
    
    @IBOutlet weak var EmailView: UIView!
    @IBOutlet weak var EmailTF: UITextField!

    @IBOutlet weak var PhoneView: UIView!
    @IBOutlet weak var PhoneTF: UITextField!

    @IBOutlet weak var GenderView: UIView!
    @IBOutlet weak var GenderTF: UITextField!
    @IBOutlet weak var MaleImage: UIImageView!
    @IBOutlet weak var MaleButton: UIButton!
    @IBOutlet weak var FemaleImage: UIImageView!
    @IBOutlet weak var FemaleButton: UIButton!

    @IBOutlet weak var DOBView: UIView!
    @IBOutlet weak var DOBTF: UITextField!

    @IBOutlet weak var CountryView: UIView!
    @IBOutlet weak var CountryTF: UITextField!

    @IBOutlet weak var CityView: UIView!
    @IBOutlet weak var CityTF: UITextField!

    @IBOutlet weak var ZipView: UIView!
    @IBOutlet weak var ZipTF: UITextField!

    @IBOutlet weak var NationalityView: UIView!
    @IBOutlet weak var NationalityTF: UITextField!

    @IBOutlet weak var NationaIDOView: UIView!
    @IBOutlet weak var NationaIDOTF: UITextField!

    @IBOutlet weak var NationaIDView: UIView!
    @IBOutlet weak var NationaIDTF: UITextField!

    @IBOutlet weak var ProfileDescView: UIView!
    @IBOutlet weak var ProfileDescTV: UITextView!

    @IBOutlet weak var UpdateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FullNameView.setCurverBorderView(borderColor: .lightGray, size: 20)
        FullNameTF.setPlaceholder(color: .lightGray, string: "Jhon Doe")
        
        EmailView.setCurverBorderView(borderColor: .lightGray, size: 20)
        EmailTF.setPlaceholder(color: .lightGray, string: "abcd@abcd.com")
        
        PhoneView.setCurverBorderView(borderColor: .lightGray, size: 20)
        PhoneTF.setPlaceholder(color: .lightGray, string: "+971 555 22 333")
        
        GenderView.setCurverBorderView(borderColor: .lightGray, size: 20)
        GenderTF.text = "Female"
        GenderTF.isEnabled = false
        FemaleButton.setCurveBorderButton(color: .clear, size: 12.5)
        FemaleButton.backgroundColor = Colors.bussiness_type_dark_green
        FemaleImage.tintColor = .white
        
        DOBView.setCurverBorderView(borderColor: .lightGray, size: 20)
        DOBTF.setPlaceholder(color: .lightGray, string: "19/02/1996")

        CountryView.setCurverBorderView(borderColor: .white, size: 20)
        CountryTF.setPlaceholder(color: .lightGray, string: "Pakistan")

        CityView.setCurverBorderView(borderColor: .lightGray, size: 20)
        CityTF.setPlaceholder(color: .lightGray, string: "Karachi")
        
        ZipView.setCurverBorderView(borderColor: .lightGray, size: 20)
        ZipTF.setPlaceholder(color: .lightGray, string: "Zip Code")

        NationalityView.setCurverBorderView(borderColor: .white, size: 20)
        NationalityTF.setPlaceholder(color: .white, string: "Pakistani")

        NationaIDOView.setCurverBorderView(borderColor: .lightGray, size: 20)
        NationaIDOTF.setPlaceholder(color: .white, string: "National # or Passport #")

        NationaIDView.setCurverBorderView(borderColor: .lightGray, size: 20)
        NationaIDTF.setPlaceholder(color: .darkGray, string: "National # or Passport #")

        ProfileDescView.setCurverBorderView(borderColor: .lightGray, size: 20)
//        ProfileDescTV.setPlaceholder(color: .lightGray, string: "National # or Passport #")

        UpdateButton.setCurveBorderButton(color: .clear, size: 20)
    }
    

    @IBAction func didTappedUpdate(_ sender: UIButton) {
        
        
    }
    
    
    
}
