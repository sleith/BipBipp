//
//  BannerService.swift
//  BipBipp
//
//  Created by Raymond on 11/10/20.
//

import Foundation

import Moya

enum BannerService{
    case getBanners(Void)
}

extension BannerService : TargetType{
    var baseURL: URL {
        let url = ConfigData.API_BASE_URL
        return URL(string: url)!
    }
    
    var path: String {
        switch self{
        case .getBanners(_):
            return "banners"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self{
        case .getBanners:
            return "[{\"id\":1, \"title\":\"Banner 1\", \"description\":\"Test banner 1\" ,\"imageUrl\":\"https://i.pinimg.com/originals/2a/bd/79/2abd792a12fd392768fb213078e768f0.jpg\"},{\"id\":2, \"title\":\"Banner 2\", \"description\":\"Test banner 2\" ,\"imageUrl\":\"https://i.pinimg.com/originals/2c/75/73/2c757312d0d9050058c646da711dd5f8.jpg\"},{\"id\":3, \"title\":\"Banner 3\", \"description\":\"Test banner 3\" ,\"imageUrl\":\"https://ak.picdn.net/offset/photos/5f11c057a75ca0db3709998d/medium/offset_970323.jpg\"}]".toData ?? Data()
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
