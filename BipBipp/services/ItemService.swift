//
//  ItemService.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation
import Moya

enum ItemService{
    case getItemsByCategoryId(categoryId:Int)
}
extension ItemService : TargetType{
    var baseURL: URL {
        let url = ConfigData.API_BASE_URL
        return URL(string: url)!
    }
    
    var path: String {
        switch self{
        case .getItemsByCategoryId(let categoryId) :
            return "items/category/\(categoryId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self{
        case .getItemsByCategoryId(let categoryId):
            if(categoryId == 1){
                return "[{\"id\":1, \"name\":\"Caterpillar Roll\", \"description\":\"Eel Roll topped w/ Avocado and Eel Sauce\", \"dimension\":\"10 pieces\", \"price\":12, \"imageUrl\":\"https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000370/img/basic/a0000370_main.jpg\"},{\"id\":2, \"name\":\"Mallard Creek\", \"description\":\"California Roll Topped w/Smoked Salmon, Spicy Mayo and Scallions\", \"dimension\":\"15 pieces\", \"price\":20, \"imageUrl\":\"https://www.justonecookbook.com/wp-content/uploads/2020/06/Dragon-Roll-0286-I-500x375.jpg\"},{\"id\":3, \"name\":\"Jon Snow Roll\", \"description\":\"Snow Crab, Avocado, Spicy Mayo and Sesame Seeds\", \"dimension\":\"10 pieces\", \"price\":14, \"imageUrl\":\"https://c.ndtvimg.com/2019-09/tm8ef01_sushi_625x300_27_September_19.jpg\"}]".toData ?? Data()
            }
            else if(categoryId == 2){
                return "[{\"id\":4, \"name\":\"California Blonde\", \"description\":\"Lovely cocktail\", \"dimension\":\"10 kcal\", \"price\":5, \"imageUrl\":\"https://www.californiastrawberries.com/wp-content/uploads/2015/07/California-Strawberry-Blonde1.jpg\"},\n\n{\"id\":5, \"name\":\"Summer Breeze\", \"description\":\"Feel the breeze!\", \"dimension\":\"5 kcal\", \"price\":7, \"imageUrl\":\"https://www.californiastrawberries.com/wp-content/uploads/2015/07/Strawberry-Summer-Breeze-1024.jpg\"},\n\n{\"id\":6, \"name\":\"Cranberry Gin Cocktail\", \"description\":\"Red Red Red\", \"dimension\":\"12 kcal\", \"price\":8, \"imageUrl\":\"https://laurencariscooks.com/1_lcc/wp-content/uploads/2016/12/Cranberry-Gin-Cocktail-2-2.jpg\"}\n\n]".toData ?? Data()
            }
            else{
                return "[{\"id\":7, \"name\":\"Paleo Pizza Crust\", \"description\":\"A healthy pizza crust that has a very similar flavor and texture to the real deal!\", \"dimension\":\"Medium\", \"price\":12, \"imageUrl\":\"https://sunkissedkitchen.com/wp-content/uploads/2018/09/paleo-pizza-rc-500x375.jpg\"},\n\n{\"id\":8, \"name\":\"Paleo Pizza Margarita\", \"description\":\"This grain-free, dairy-free pizza will make everyone happy!\", \"dimension\":\"Medium\", \"price\":9, \"imageUrl\":\"https://kitchenofyouth.com/wp-content/uploads/2016/08/paleo-pizza-margarita-cropped-vertical-separated-3628.jpg\"},\n\n{\"id\":9, \"name\":\"Spicy Chicken Pizza\", \"description\":\"Here\'s what you need: pizza sauce, Frank\'s Red Hot Original, olive oil, cornmeal, pizza dough.\", \"dimension\":\"Large\", \"price\":12, \"imageUrl\":\"https://img.buzzfeed.com/thumbnailer-prod-us-east-1/video-api/assets/216054.jpg\"}\n\n]".toData ?? Data()
            }
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
