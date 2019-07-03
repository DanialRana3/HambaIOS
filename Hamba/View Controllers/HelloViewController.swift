//
//  HelloViewController.swift
//  Hamba
//
//  Created by Hexagonal3 on 08/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {

    @IBOutlet weak var HelloIcon: UIImageView!
    @IBOutlet weak var RobotIcon: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameView: UIView!
    @IBOutlet weak var CountLabel: UILabel!
    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var EnterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NameView.setCurverBorderView(borderColor: Colors.bussiness_type_dark_green, size: 20)
        NameTF.setPlaceholder(color: Colors.bussiness_type_dark_green, string: "SOPHIA JACOB")
        EnterButton.setCurveBorderButton(color: .clear, size: 20)
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.animateViews()
    }
    
    func animateViews() {
        
        UIView.animate(withDuration: 2, animations: {
            self.RobotIcon.frame.origin.x -= 64
        }) { _ in
            UIView.animate(withDuration: 2, delay: 0.25, options: [.curveEaseIn], animations: {
                self.HelloIcon.isHidden = false
                self.HelloIcon.frame.origin.y += 64
            }){ _ in
                UIView.transition(with: self.NameLabel, duration: 1.0, options: .transitionCrossDissolve, animations: {
                    self.NameLabel.isHidden = false
                }, completion: { (status) in
                    UIView.transition(with: self.NameView, duration: 2.0, options: .transitionFlipFromLeft, animations: {
                        self.NameView.isHidden = false
                        self.EnterButton.isHidden = false
                    }, completion: { (status) in
                        UIView.animate(withDuration: 2, delay: 0.25, options: [.autoreverse, .repeat], animations: {
                            self.HelloIcon.frame.origin.y += 5
                        })
                    })
                })
            }
        }
    }
}
