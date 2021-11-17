//
//  Showable.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

//extension BaseViewController : Showable {
//    func toShowable() -> UIViewController {
//        return self
//    }
//}
extension UIViewController : Showable {
func toShowable() -> UIViewController {
    return self
 }
}
