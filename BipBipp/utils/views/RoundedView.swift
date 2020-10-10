//
//  RoundedView.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation
import UIKit

class RoundedView : UIView {
    
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
        dropShadow(cornerRadius: CGFloat(ConfigData.ROUNDED_CORNER_RADIUS), shadowOffset: CGSize(width:-1, height:1), shadowRadius: 5, shadowOpacity: 0.2)
        
    }
     
}
