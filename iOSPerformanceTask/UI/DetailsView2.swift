//
//  DetailsView2.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import UIKit

class DetailsView2: UIView {

    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
   
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
                    self.imageView.image = loadedImage
                    self.imageView.layer.masksToBounds = false
                    
                    self.imageView.layer.cornerRadius = self.imageView.frame.height/2
                    self.imageView.clipsToBounds = true
                                    }
            }else {
                DispatchQueue.main.async{
                    self.imageView.image = UIImage()
                }
            }
       
        }
        task.resume()
    }
    
    func setKnownFor(knownFor: String){
        departmentLabel.text = knownFor
    }
    
}
