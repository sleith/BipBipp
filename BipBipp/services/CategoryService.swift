//
//  CategoryService.swift
//  BipBipp
//
//  Created by Raymond on 10/10/20.
//

import Foundation
import Moya

enum CategoryService{
    case getCategories(Void)
}

extension CategoryService : TargetType{
    var baseURL: URL {
        let url = ConfigData.API_BASE_URL
        return URL(string: url)!
    }
    
    var path: String {
        switch self{
        case .getCategories(_):
            return "categories"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self{
        case .getCategories:
            return "[{\"id\":1, \"title\":\"Sushi\"}, {\"id\":2, \"title\":\"Drinks\"}, {\"id\":3, \"title\":\"Pizza\"}]".toData ?? Data()
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
