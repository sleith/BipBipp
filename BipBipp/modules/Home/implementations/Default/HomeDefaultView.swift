//
//  HomeDefaultView.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import UIKit

class HomeDefaultView: UIViewController {
    var presenter: HomePresenter?

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mBtnCart: CartButton!
    
    var mCategories : [CategoryModel] = []
    var mCurrCategory : CategoryModel? = nil
    var mItemList : [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu"
        
        let nib = UINib.init(nibName: "HomeItemTableViewCell", bundle: nil)
        mTableView.register(nib, forCellReuseIdentifier: "cell")
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.separatorStyle = .none
        
        presenter?.fetchCategories()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onBtnClicked(_ sender: UIButton) {
        if(sender == mBtnCart){
            presenter?.routeToCartScreen()
        }
    }
}
extension HomeDefaultView : HomeView{
    func displayCategories(categories: [CategoryModel]) {
        mCategories = categories
        mCurrCategory = categories.first
        mTableView.reloadData()
        
        if let category = mCurrCategory{
            presenter?.fetchItems(categoryId: category.id ?? 0)
        }
    }
    
    func displayItems(items: [ItemModel], categoryId: Int) {
        mItemList = items
        mTableView.reloadData()
    }
}
extension HomeDefaultView : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if(section == 0){
//            return mCategories.count
//        }else{
//            return mItemList.count
//        }
        return mItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if(indexPath.section == 0){
//
//        }else{
//
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeItemTableViewCell
        let item = mItemList[indexPath.row]
        cell.update(item: item) {
            self.presenter?.addItem(item: item)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    
}
extension HomeDefaultView : UITableViewDelegate{
    
}
