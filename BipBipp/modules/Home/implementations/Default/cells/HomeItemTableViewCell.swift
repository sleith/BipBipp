//
//  HomeItemTableViewCell.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import UIKit
import Kingfisher

class HomeItemTableViewCell: UITableViewCell {

    @IBOutlet weak var mIvImage: UIImageView!
    @IBOutlet weak var mLblTitle: UILabel!
    @IBOutlet weak var mLblDescription: UILabel!
    @IBOutlet weak var mLblDimension: UILabel!
    @IBOutlet weak var mBtnPrice: UIButton!
    
    var mCallback : (() -> ())?
    var mItem : ItemModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(item:ItemModel, callback: @escaping ()->Void){
        self.mCallback = callback
        self.mItem = item
        
        mIvImage.kf.setImage(with:URL(string: item.imageUrl ?? ""))
        mLblTitle.text = item.name
        mLblDescription.text = item.description
        mLblDimension.text = item.dimension
        mBtnPrice.setTitle(item.priceString(), for: .normal)

        mBtnPrice.removeTarget(self, action: #selector(self.onActionClicked(sender:)), for: .touchUpInside)
        mBtnPrice.addTarget(self, action: #selector(self.onActionClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func onActionClicked(sender: UIButton) {
        
        sender.setTitle("Added +1", for: .normal)
        sender.backgroundColor = ConfigData.DARK_GREEN_COLOR.toColor
        DispatchQueue.global(qos: .userInitiated).async {
            usleep(800000)
            DispatchQueue.main.async {
                sender.setTitle(self.mItem?.priceString(), for: .normal)
                sender.backgroundColor = UIColor.black
            }
        }
        
        mCallback?()
    }
}
