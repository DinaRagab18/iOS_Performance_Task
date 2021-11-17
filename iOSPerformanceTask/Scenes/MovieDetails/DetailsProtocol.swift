//
//  DetailsProtocol.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation

protocol DetailsModelProtocol {
    func getPerson() -> Person?
}

protocol DetailsPresenterProtocol {
   func getItem() -> Person?
}
protocol DetailsViewProtocol: class {
    
}
