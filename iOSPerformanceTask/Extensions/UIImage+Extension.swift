//
//  UIImage+Extension.swift
//  TestApp
//
//  Created by Ibtikar on 15/11/2021.
//

import Foundation
import UIKit

extension UIImage {
    var withTonalFilter: UIImage? {
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIPhotoEffectTonal")
        let input = CoreImage.CIImage(image: self)
        filter?.setValue(input, forKey: kCIInputImageKey)
        
        guard let outputImage = filter?.outputImage, let outImage = context.createCGImage(outputImage, from: outputImage.extent) else {return nil}
        
        let returnImage = UIImage(ciImage: outputImage)
        return returnImage
    }
}
