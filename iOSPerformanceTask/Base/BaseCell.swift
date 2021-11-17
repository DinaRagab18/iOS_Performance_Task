//
//  BaseCell.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
protocol BaseCellProtocol {
   
    func configureCell(item: Any)
}
@objc 
extension UITableViewCell: BaseCellProtocol {
    func configureCell(item: Any) {

    }
}
