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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(item:ItemModel){
        mIvImage.kf.setImage(with:URL(string: item.imageUrl ?? ""))
        mLblTitle.text = item.name
        mLblDescription.text = item.description
        mLblDimension.text = item.dimension
        mBtnPrice.setTitle("$" + (item.price?.description ?? ""), for: .normal)
    }
    
}
