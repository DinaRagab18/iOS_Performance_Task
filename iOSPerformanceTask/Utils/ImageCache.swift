//
//  ImageCache.swift
//  iOSPerformanceTask
//
//  Created by Mahmoud Nasser on 11/17/21.
//

import Foundation
import UIKit

class ImageCache {
  static let shared = ImageCache()
  var images: [String: UIImage] = [:]

  init() {
    NotificationCenter.default.addObserver(
      forName: UIApplication.didReceiveMemoryWarningNotification,
      object: nil,
      queue: .main) { [weak self] _ in
        self?.images.removeAll(keepingCapacity: false)
    }
  }

    func loadThumbnail(for id: String, url: String, completion: @escaping  (Result<UIImage, CustomError>) -> Void) {
    if let image = ImageCache.shared.image(forKey: id) {
      completion(Result.success(image))
    } else {
        
      FlickrAPI.loadImage(for: url) { result in
        if case .success(let image) = result {
          ImageCache.shared.set(image, forKey: id)
        }
        completion(result)
      }
    }
  }
}

// MARK: - Custom Accessors
extension ImageCache {
  func set(_ image: UIImage, forKey key: String) {
    images[key] = image
  }

  func image(forKey key: String) -> UIImage? {
    return images[key]
  }
}

enum CustomError: Error {
  case noData
  case jsonSerializationFailed(reason: String)
  case requestFailed(reason: String)
  case processingPhotosFailed(reason: String)
  case imageCreationFailed
}

// MARK: - Image Loading
class FlickrAPI {
 
 
    static func loadImage(for url: String, completion: @escaping  (Result<UIImage, CustomError>) -> Void) {
    let session = URLSession.shared

    guard let url =  URL(string: "https://image.tmdb.org/t/p/w500"+url) else { return }

    let dataTask = session.dataTask(with: url) { data, _, error in
      let result = self.processImageRequest(data, error as? CustomError)

      OperationQueue.main.addOperation {
        completion(result)
      }
    }
    dataTask.resume()
  }
    
    static func processImageRequest(_ data: Data?, _ error: CustomError?) -> Result<UIImage, CustomError> {
      guard
        let imageData = data,
        let image = UIImage(data: imageData)
      else {
        if let error = error, data == nil {
          return .failure(error)
        } else {
          return .failure(CustomError.imageCreationFailed)
        }
      }
      return Result.success(image)
    }
}


