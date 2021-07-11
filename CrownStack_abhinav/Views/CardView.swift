//
//  CardView.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 11/07/21.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 4
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    @IBInspectable var borderWidth: CGFloat = 0.5
    @IBInspectable var borderColor: UIColor = UIColor.lightGray
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.withAlphaComponent(0.3).cgColor
        layer.borderWidth = borderWidth
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
