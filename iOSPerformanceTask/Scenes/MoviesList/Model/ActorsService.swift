//
//  AppNetwork.swift
//  TestMoyaAndObjectMapper
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import Moya

 let appNetworkProvider = MoyaProvider<ActorsService>(plugins: [MoyaCacheablePlugin()])

enum  ActorsService {
    case popular
}

extension ActorsService: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/person/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .popular:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .popular :
            return .requestParameters(
                parameters: ["api_key":"1a45f741aada87874aacfbeb73119bae"],
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

