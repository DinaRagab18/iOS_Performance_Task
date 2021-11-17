//
//  DetailsModel.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation

class DetailsModel: DetailsModelProtocol {
    func getPerson() -> Person? {
         return self.person
    }
    
    var person: Person?
    
     
}
