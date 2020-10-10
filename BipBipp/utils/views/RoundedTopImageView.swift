//
//  RoundedTopImageView.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation
import UIKit

class RoundedTopImageView : UIImageView{
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
        layer.cornerRadius = CGFloat(ConfigData.ROUNDED_CORNER_RADIUS)
        if #available(iOS 11.0, *) {
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        clipsToBounds = true
    }
}
