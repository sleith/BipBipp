//
//  HomeDefaultView.swift
//  BipBipp
//
//  Created by Raymond on 9/10/20.
//

import UIKit
import ParallaxHeader
import ImageSlideshow
import Kingfisher

class HomeDefaultView: UIViewController {
    var presenter: HomePresenter?

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mBtnCart: CartButton!
    var mCarouselView : ImageSlideshow!
    
    var mCategories : [CategoryModel] = []
    var mCurrCategory : CategoryModel? = nil
    var mItemList : [ItemModel] = []
    var mCategoryIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu"
        
        let nibTabCell = UINib.init(nibName: "TabCategoryTableViewCell", bundle: nil)
        mTableView.register(nibTabCell, forCellReuseIdentifier: "tabCell")
        
        let nibCell = UINib.init(nibName: "HomeItemTableViewCell", bundle: nil)
        mTableView.register(nibCell, forCellReuseIdentifier: "cell")
        
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.separatorStyle = .none
        
        let parallaxHeight : CGFloat = self.view.frame.height * 0.5

        /// setup carousel
        mCarouselView = ImageSlideshow(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: parallaxHeight))
        mCarouselView.slideshowInterval = 5.0
        mCarouselView.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        mCarouselView.contentScaleMode = UIViewContentMode.scaleAspectFill

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        mCarouselView.pageIndicator = pageControl
        mCarouselView.pageIndicatorPosition = PageIndicatorPosition(horizontal: .center, vertical: .bottom)
        mCarouselView.activityIndicator = DefaultActivityIndicator()
        ////////
        
        /// setup logo
        let lblApp = UILabel.init(frame: CGRect.init(x: 0, y: 10, width: 0, height: 0))
        lblApp.text = "- BipBipp -\nIt's Ready!"
        lblApp.lineBreakMode = .byWordWrapping
        lblApp.numberOfLines = 0
        lblApp.textAlignment = .center
        lblApp.textColor = UIColor.white
        lblApp.font = UIFont.boldSystemFont(ofSize: 20)
        lblApp.sizeToFit()
        lblApp.frame.origin.x = (self.view.frame.size.width - lblApp.frame.width) / 2
        ////
        
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: parallaxHeight))
        headerView.addSubview(mCarouselView)
        headerView.addSubview(lblApp)
        
        mTableView.parallaxHeader.view = headerView
        mTableView.parallaxHeader.height = parallaxHeight
        mTableView.parallaxHeader.minimumHeight = 0
        mTableView.parallaxHeader.mode = .centerFill

        presenter?.fetchCategories()
        presenter?.fetchBanners()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func onBtnClicked(_ sender: UIButton) {
        if(sender == mBtnCart){
            presenter?.routeToCartScreen()
        }
    }
}
extension HomeDefaultView : HomeView{
    func displayBanners(banners: [BannerModel]) {
        var inputSource:[KingfisherSource] = []
        for curr in banners{
            if let source = KingfisherSource(urlString: curr.imageUrl ?? ""){
                inputSource.append(source)
            }
        }
        mCarouselView.setImageInputs(inputSource)

    }
    
    func displayCategories(categories: [CategoryModel]) {
        mCategories = categories
        mCategoryIndex = 0
        mCurrCategory = categories[mCategoryIndex]
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
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 1
        }else{
            return mItemList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "tabCell") as! TabCategoryTableViewCell
            cell.update(currTabIndex: mCategoryIndex, categories: mCategories) { index in
                self.mCategoryIndex = index
                self.mCurrCategory = self.mCategories[self.mCategoryIndex]
                self.presenter?.fetchItems(categoryId: self.mCurrCategory?.id ?? 0)
            }
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeItemTableViewCell
            let item = mItemList[indexPath.row]
            cell.update(item: item) {
                self.presenter?.addItem(item: item)
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
}
extension HomeDefaultView : UITableViewDelegate{
    
}
