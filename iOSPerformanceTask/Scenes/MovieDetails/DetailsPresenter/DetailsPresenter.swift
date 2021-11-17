//
//  DetailsPresenter.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol{
    
    func getItem() -> Person? {
         return model?.getPerson()
    }
    
    //Mark: Modified : weak to avoid retain cycle
    weak var view: DetailsViewProtocol?
    var model: DetailsModelProtocol?
    weak var detailsDelegate: DetailsDelegate?

   init(view: DetailsViewProtocol, model: DetailsModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func popView() {
            detailsDelegate?.popView()
        }
   
}

protocol DetailsDelegate: AnyObject {
    func popView()
}
