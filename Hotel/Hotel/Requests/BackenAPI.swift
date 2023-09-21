//
//  BackenAPI.swift
//  Hotel
//
//  Created by Kamil Vakhobov on 20.09.23.
//

import Foundation
import Moya

enum BackenAPI {
    case getImages
}

extension BackenAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getImages:
            return URL(string: "https://run.mocky.io/")!
        }
    }
    
    var path: String {
        switch self {
        case .getImages:
            return "v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getImages:
            return .get
        }
    }
    
    var task: Moya.Task {
        guard let parametrs else { return .requestPlain}
        return .requestParameters(parameters: parametrs, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parametrs: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .getImages:
            return nil
        }
        
        return params
        
    }
    
    var encoding: JSONEncoding {
        switch self {
        case .getImages:
            return JSONEncoding.prettyPrinted
        }
    }
    
    
}
