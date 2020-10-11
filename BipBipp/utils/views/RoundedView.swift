//
//  RoundedView.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation
import UIKit

class RoundedView : UIView {
    var roundedCornerSize = ConfigData.ROUNDED_CORNER_RADIUS
    
    @IBInspectable var cornerSize: String {
        get {
            return roundedCornerSize.description
        }
        set(value) {
            self.roundedCornerSize = Int(value) ?? ConfigData.ROUNDED_CORNER_RADIUS
            self.layer.cornerRadius = CGFloat(self.roundedCornerSize)
        }
    }
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
    }

    override func prepareForInterfaceBuilder() {
         super.prepareForInterfaceBuilder()
         commonInit()
    }
    
    func commonInit(){
        dropShadow(cornerRadius: CGFloat(roundedCornerSize), shadowOffset: CGSize(width:-1, height:1), shadowRadius: 5, shadowOpacity: 0.2)
    }
     
}
