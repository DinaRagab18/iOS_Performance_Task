//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Ahmed Refaat on 11/11/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    typealias Data = Person
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var id = 0
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //Mark: Modified
      //  self.imgView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    //Mark: Modified caching images 
    override func configureCell(item: Any) {
        let cellItem = item as? Person
        self.id = cellItem?.id ?? 0
        nameLabel.text = cellItem?.name
        if cellItem?.knownFor?.isEmpty == false {
            if let path = cellItem?.knownFor?[0].posterPath {
                ImageCache.shared.loadThumbnail(for: String(cellItem?.id ?? 0),
                                                url: path){  [weak self] result in
                    guard let self = self else { return }
                  switch result {
                  case .success(let image):
                     
                    if self.id == cellItem?.id {
                        // 1
                    if let cachedImage = ImageCache.shared.image(forKey: "\(self.id)-filtered") {
                        self.imgView.image = cachedImage
                        } else {
                          // 2
                          DispatchQueue.global().async { [weak self] in
                            guard let self = self else { return }
                            if let filteredImage = image.withTonalFilter {
                              ImageCache.shared.set(filteredImage, forKey: "\(self.id)-filtered")

                              DispatchQueue.main.async { [weak self] in
                                guard let self = self else { return }
                                self.imgView.image = filteredImage
                              }
                            }
                          }
                        }
                      
                    }
                  case .failure(let error):
                    print("Error: \(error)")
                  }
                }
            }
        }
        
    }


func getImage(urlString: String){
   
    let url = URL(string: "https://image.tmdb.org/t/p/w500"+urlString)

    
    
    let task = URLSession.shared.dataTask(with: url!){ (data, resonse , error) in
        if error == nil && data != nil{
            
         let loadedImage = UIImage(data: data!)

            //Mark: Modified
              DispatchQueue.main.async { [weak self] in
                //Mark: Modified
                guard let self = self else { return }
                  self.imgView.image = loadedImage?.withTonalFilter
                self.imgView.layer.masksToBounds = false
                
                self.imgView.layer.cornerRadius = self.imgView.frame.height/2
                self.imgView.clipsToBounds = true

            }
        }else {
            DispatchQueue.main.async{ [weak self] in
                //Mark: Modified
                guard let self = self else { return }
                self.imgView.image = UIImage()
            }
        }
   
    }
    task.resume()
}
}

//class ImageCache {
//  static let shared = ImageCache()
//  var images: [String: UIImage] = [:]
//
//  init() {
//    NotificationCenter.default.addObserver(
//      forName: UIApplication.didReceiveMemoryWarningNotification,
//      object: nil,
//      queue: .main) { [weak self] _ in
//        self?.images.removeAll(keepingCapacity: false)
//    }
//  }
//
//    func loadThumbnail( id: Int, imageUrl: String, completion: @escaping (Swift.Result<UIImage, Error>) -> Void) {
//    if let image = ImageCache.shared.image(forKey: String(id)) {
//      completion(Result.success(image))
//    } else {
//
//        loadImage(for: imageUrl) { (result) in
//            
//        }
//    }
//  }
//    
//    func loadImage(for urlString: String,
//                   completion: @escaping (Swift.Result<UIImage, Error>) -> Void) {
//      let session = URLSession.shared
//
//        if let url = URL(string: "https://image.tmdb.org/t/p/w500"+urlString) {
//
//
//      let dataTask = session.dataTask(with: url) { data, _, error in
//        let result = self.processImageRequest(data, error)
//
//        OperationQueue.main.addOperation {
//          completion(result)
//        }
//      }
//      dataTask.resume()
//        }
//    }
//    
//    func processImageRequest(_ data: Data?, _ error: Error?) -> Swift.Result<UIImage, CustomError> {
//      guard
//        let imageData = data,
//        let image = UIImage(data: imageData)
//      else {
//        
//        if let error = error, data == nil {
//          return .failure(error)
//        } else {
//            return .failure(Error.)
//        }
//      }
//      return Result.success(image)
//    }
//}
//
//// MARK: - Custom Accessors
//extension ImageCache {
//  func set(_ image: UIImage, forKey key: String) {
//    images[key] = image
//  }
//
//  func image(forKey key: String) -> UIImage? {
//    return images[key]
//  }
//}
//
//enum CustomError: Error {
//  case noData
//  case jsonSerializationFailed(reason: String)
//  case requestFailed(reason: String)
//  case processingPhotosFailed(reason: String)
//  case imageCreationFailed
//}
//
