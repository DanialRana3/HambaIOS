//
//  ProfileViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit
import FlagPhoneNumber

class ProfileViewController: UIViewController {

    
    var isGenderMale = true
    
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
    @IBOutlet weak var CountryTF: FPNTextField!

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
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        FullNameView.setCurverBorderView(borderColor: .lightGray, size: 20)
        FullNameTF.setPlaceholder(color: .lightGray, string: "Jhon Doe")
        
        EmailView.setCurverBorderView(borderColor: .lightGray, size: 20)
        EmailTF.setPlaceholder(color: .lightGray, string: "abc@mail.com")
        
        PhoneView.setCurverBorderView(borderColor: .lightGray, size: 20)
        PhoneTF.setPlaceholder(color: .lightGray, string: "+971 555 22 333")
        
       
        
        DOBView.setCurverBorderView(borderColor: .lightGray, size: 20)
        DOBTF.setPlaceholder(color: .lightGray, string: "19/02/1996")
        

        CountryView.setCurverBorderView(borderColor: .lightGray, size: 20)
        CountryTF.setPlaceholder(color: .lightGray, string: "Pakistan")

        CityView.setCurverBorderView(borderColor: .lightGray, size: 20)
        CityTF.setPlaceholder(color: .lightGray, string: "Karachi")
        
        ZipView.setCurverBorderView(borderColor: .lightGray, size: 20)
        ZipTF.setPlaceholder(color: .lightGray, string: "Zip Code")

        NationalityView.setCurverBorderView(borderColor: .lightGray, size: 20)
        NationalityTF.setPlaceholder(color: .lightGray, string: "Pakistani")

        NationaIDOView.setCurverBorderView(borderColor: .lightGray, size: 20)
        NationaIDOTF.setPlaceholder(color: .lightGray, string: "National # or Passport #")

        NationaIDView.setCurverBorderView(borderColor: .lightGray, size: 20)
        NationaIDTF.setPlaceholder(color: .lightGray, string: "National # or Passport #")

        ProfileDescView.setCurverBorderView(borderColor: .lightGray, size: 20)
//        ProfileDescTV.setPlaceholder(color: .lightGray, string: "National # or Passport #")

        UpdateButton.setCurveBorderButton(color: .clear, size: 20)
        
        self.setDatePicker()
        
        
        
        
    }
    

    func setDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        DOBTF.inputAccessoryView = toolbar
        DOBTF.inputView = datePicker
    }
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        DOBTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func genderInit() {
        GenderView.setCurverBorderView(borderColor: .lightGray, size: 20)
      GenderTF.isEnabled = false
        FemaleImage.layer.cornerRadius = 12.5
        MaleImage.layer.cornerRadius = 12.5
        
        if isGenderMale {
            MaleImage.backgroundColor = .green
            FemaleImage.backgroundColor = .clear
            GenderTF.text = "Male"
        }else{
            MaleImage.backgroundColor = .clear
            FemaleImage.backgroundColor = .green
            GenderTF.text = "Female"
        }
    }
    @IBAction func didTappedUpdate(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func maleBtn(_ sender: Any) {
        isGenderMale = true
        self.genderInit()
    }
    
    @IBAction func femaleBtn_action(_ sender: Any) {
        isGenderMale = false
        self.genderInit()
    }
}

