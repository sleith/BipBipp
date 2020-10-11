//
//  TabCategoryTableViewCell.swift
//  BipBipp
//
//  Created by Raymond on 11/10/20.
//

import UIKit

class TabCategoryTableViewCell: UITableViewCell {
 
    @IBOutlet weak var mView: UIView!
    
    var mCallback : ((Int) -> ())?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(currTabIndex:Int, categories:[CategoryModel], callback: @escaping (Int)->Void){
        mCallback = callback
        
        for curr in mView.subviews{
            curr.removeFromSuperview()
        }
        
        var currX : CGFloat = 0.0
        let buttonWidth : CGFloat = mView.frame.width / CGFloat(categories.count)
        var index = 0
        for currCategory in categories{
            let button = UIButton.init(frame: CGRect.init(x: currX, y: 0, width: buttonWidth, height: mView.frame.height))
            button.tag = index
            button.setTitle(currCategory.title, for: .normal)
            if(currTabIndex == index){
                button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                button.setTitleColor(UIColor.black, for: .normal)
            }else{
                button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
                button.setTitleColor(UIColor.darkGray, for: .normal)
            }
            button.addTarget(self, action: #selector(self.onActionClicked(sender:)), for: .touchUpInside)
            
            mView.addSubview(button)
            currX += buttonWidth
            
            index += 1
        }
    }
    
    @objc func onActionClicked(sender: UIButton) {
        mCallback?(sender.tag)
    }
    
}
