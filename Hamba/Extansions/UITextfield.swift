//
//  UITextfield.swift
//  Hamba
//
//  Created by Hexagonal3 on 07/06/2019.
//  Copyright © 2019 Hexagonal3. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
   
    func setPlaceholder(color:UIColor,string: String){
        
        self.attributedPlaceholder = NSAttributedString(string: string,
                                                        attributes: [NSAttributedString.Key.font: UIFont(name: "duCoHeadline16-Regular", size: 17)!, NSAttributedString.Key.foregroundColor: color])
        
    }
    

}
