//
//  MoyaCaching.swift
//  MovieApp
//
//  Created by sara.galal on 11/20/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import Moya
protocol MoyaCacheable {
  typealias MoyaCacheablePolicy = URLRequest.CachePolicy
  var cachePolicy: MoyaCacheablePolicy { get }
}

final class MoyaCacheablePlugin: PluginType {
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    if let moyaCachableProtocol = target as? MoyaCacheable {
      var cachableRequest = request
      cachableRequest.cachePolicy = moyaCachableProtocol.cachePolicy
      return cachableRequest
    }
    return request
  }
}
extension ActorsService: MoyaCacheable {
  var cachePolicy: MoyaCacheablePolicy {
    switch self {
    case .popular:
      return .reloadIgnoringLocalCacheData
    }
  }
}

