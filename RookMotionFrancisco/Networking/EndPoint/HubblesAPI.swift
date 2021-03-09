//
//  HubblesAPI.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 08/03/21.
//

import Foundation

enum HubbleApi{
    case news
}

extension HubbleApi: EndPointType {
    
    var baseUrl: URL {
        guard let url = URL(string: "http://hubblesite.org") else { fatalError("URL base de hubble news no configurada") }
        return url
    }
    
    var path: String {
        switch self {
        case .news:
            return "/api/v3/external_feed/esa_feed"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .news:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .news:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
