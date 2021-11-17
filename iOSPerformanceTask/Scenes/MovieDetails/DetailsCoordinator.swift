//
//  DetailsCoordinator.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class DetailsCoordinator : Coordinator {
    //Mark: Modified : remove root view
    private let router: AppRouter
    var person : Person
   // private var detailsViewController: DetailsViewController?
    
    //Mark: Modified : add completion to remove coordinator reference when dismiss view 
    private var completion: (() -> Void)?
    
        init(router: AppRouter , person : Person, completion: @escaping (() -> Void)) {
            self.router = router
            self.person = person
            self.completion = completion
        }
    
    private func createModule() -> DetailsViewController {
      let view = DetailsViewController()
        let model = DetailsModel()
        model.person = person
        let presenter = DetailsPresenter(view: view, model: model)
        presenter.detailsDelegate = self
        view.setPresenter(presenter: presenter)
        return view
    }
    
    func start() {
        let detailsVc = self.createModule()
         detailsVc.title = "Details"
        router.push(detailsVc, animated: true, completion:nil)
    }
}

extension DetailsCoordinator: DetailsDelegate {
    func popView() {
        router.pop(animated: true)
        
        completion?()

    }
}
