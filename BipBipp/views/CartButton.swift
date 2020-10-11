//
//  CartButton.swift
//  BipBipp
//
//  Created by Raymond on 11/10/20.
//

import Foundation
import UIKit

class CartButton : RoundedButton{
    
    var countLabel : UILabel!
    
    override func setup() {
        super.setup()
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = false
        
        //add count label
        let lblSize = self.frame.width / 3
        countLabel = UILabel.init(frame: CGRect.init(x: self.frame.width - lblSize, y: 0, width: lblSize, height: lblSize))
        countLabel.layer.cornerRadius = lblSize / 2
        countLabel.textColor = UIColor.white
        countLabel.font = UIFont.systemFont(ofSize: 10)
        countLabel.backgroundColor = ConfigData.DARK_GREEN_COLOR.toColor
        countLabel.textAlignment = .center
        countLabel.clipsToBounds = true
        addSubview(countLabel)

        updateCartCount()
        
        //listen for cart changes
        NotificationCenter.default.addObserver(self, selector: #selector(onCartChanges(_:)), name: .cartChanges, object: nil)
    }
    
    @objc func onCartChanges(_ notification:Notification) {
        updateCartCount()
    }
    
    func updateCartCount(){
        let count = CartStorage.instance.totalItemCount()
        countLabel.text = count.description
        countLabel.isHidden = count<=0
    }
}
