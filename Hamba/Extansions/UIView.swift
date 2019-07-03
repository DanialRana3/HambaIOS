//
//  UIView.swift
//  Meditation
//
//  Created by Hexagonal3 on 30/05/2019.
//  Copyright © 2019 mm. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func applyGradientV(colours: [UIColor]) -> Void {
        self.applyGradientV(colours: colours, locations: nil)
    }
    
    func applyGradientV(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setGradientBackgroundV(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setCurverBorderView(borderColor: UIColor,size: CGFloat){
        
        let path = UIBezierPath(roundedRect:self.bounds,byRoundingCorners:[.topRight, .bottomRight, .topLeft , .bottomLeft],cornerRadii: CGSize(width: size, height: size))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path // Reuse the Bezier path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = 4
        borderLayer.frame = self.bounds
        self.layer.addSublayer(borderLayer)
    }
}
