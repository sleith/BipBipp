//
//  CartItemTableViewCell.swift
//  BipBipp
//
//  Created by Raymond on 11/10/20.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {

    @IBOutlet weak var mIvImage: UIImageView!
    @IBOutlet weak var mLblName: UILabel!
    @IBOutlet weak var mLblPrice: UILabel!
    @IBOutlet weak var mBtnDelete: UIButton!
    
    var mCallback : (() -> ())?
    var mCart : CartModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(cart:CartModel, callback: @escaping ()->Void){
        self.mCallback = callback
        self.mCart = cart
        
        mIvImage.kf.setImage(with:URL(string: cart.item?.imageUrl ?? ""))
        mLblName.text = (cart.item?.name ?? "") + "\nx" + (cart.qty?.description ?? "")
        mLblPrice.text = "$\(cart.totalPrice().description)"

        mBtnDelete.removeTarget(self, action: #selector(self.onActionClicked(sender:)), for: .touchUpInside)
        mBtnDelete.addTarget(self, action: #selector(self.onActionClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func onActionClicked(sender: UIButton) {
        mCallback?()
    }
}
