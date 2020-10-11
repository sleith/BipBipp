//
//  CartDefaultView.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import UIKit

class CartDefaultView: UIViewController {
    var presenter: CartPresenter?
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mLblTotal: UILabel!
    
    var mCartList : [CartModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cart"
        self.navigationController?.setNavigationBarHidden(false, animated: false)

        let nib = UINib.init(nibName: "CartItemTableViewCell", bundle: nil)
        mTableView.register(nib, forCellReuseIdentifier: "cell")
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.separatorStyle = .none
        
        presenter?.loadData()
    }
}
extension CartDefaultView : CartView{
    func showCart(cartList: [CartModel]) {
        mCartList = cartList
        mTableView.reloadData()
    }
    func showTotalPrice(price: Double) {
        mLblTotal.text = "$" + price.description
    }
}
extension CartDefaultView : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mCartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartItemTableViewCell
        let cart = mCartList[indexPath.row]
        cell.update(cart: cart) {
            self.presenter?.removeCart(cart: cart)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
extension CartDefaultView : UITableViewDelegate{
    
}
