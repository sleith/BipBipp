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
            return "[{\"id\":1, \"title\":\"Banner 1\", \"description\":\"Test banner 1\" ,\"imageUrl\":\"https://www.manilaonsale.com/wp-content/uploads/2017/06/brothersburger.jpg\"},{\"id\":2, \"title\":\"Banner 2\", \"description\":\"Test banner 2\" ,\"imageUrl\":\"https://previews.agefotostock.com/previewimage/medibigoff/9577c57f8721108c4fadf3bdf5e6dbb3/esy-044038877.jpg\"},{\"id\":3, \"title\":\"Banner 3\", \"description\":\"Test banner 3\" ,\"imageUrl\":\"http://ui.ssgcdn.com/cmpt/starfield/event/201806/28/IM20180628050433965263.jpg\"}]".toData ?? Data()
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
