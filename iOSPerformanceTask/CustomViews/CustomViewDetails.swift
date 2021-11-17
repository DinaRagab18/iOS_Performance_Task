//
//  CustomViewDetails.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import UIKit

class CustomViewDetails: UIView {

        @IBOutlet private weak var nameLabel: UILabel!
        @IBOutlet private weak var popularityLabel: UILabel!
        @IBOutlet private weak var knownForDepartmentLabel: UILabel!
        @IBOutlet private weak var profileImage: UIImageView!
    var imageLoaded: (() -> Void)?
        override func awakeFromNib() {
            super.awakeFromNib()
        }
  
        func setName(name: String){
            nameLabel.text = name
        }
        
        func setPopularity(popularity: Float){
            popularityLabel.text = "\(popularity)"
        }
        
        func setImage(path: String){
            let url = URL(string: "https://image.tmdb.org/t/p/w500"+path)

            
            
            let task = URLSession.shared.dataTask(with: url!){ (data, resonse , error) in
                if error == nil && data != nil{
                    
                 let loadedImage = UIImage(data: data!)

                      DispatchQueue.main.async {
                        self.profileImage.image = loadedImage
                        self.profileImage.layer.masksToBounds = false
                        
                        self.profileImage.layer.cornerRadius = self.profileImage.frame.height/2
                        self.profileImage.clipsToBounds = true
                          self.imageLoaded?()
                    }
                }else {
                    DispatchQueue.main.async{
                        self.profileImage.image = UIImage()
                    }
                }
           
            }
            task.resume()
        }
        
        func setKnownFor(knownFor: String){
            knownForDepartmentLabel.text = knownFor
        }
        
        
    }


