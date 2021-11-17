//
//  MoviesListCoordinator.swift
//  MovieApp
//
//  Created by Ahmed Refaat on 11/11/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class MoviesListCoordinator: Coordinator {
   private var rootVC: UIViewController?
    private let appRouter: AppRouter
    private var movieDetailsCoordinator: DetailsCoordinator?
    private var moviePresenter: MovieListPresenter?
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }
    
     func createModule() -> MovieListViewController {
        let view = MovieListViewController()
        let model = MovieListModel()
               let presenter = MovieListPresenter(model: model, view: view)
               moviePresenter = presenter
//               presenter.setDelegate(delegate: self)
               view.setPresenter(presenter: presenter)
              self.rootVC = view
        return view
    }
    
    func start() {
     let moviesList = self.createModule()
        moviePresenter?.setDelegate(delegate: self)
        appRouter.push(rootVC!, animated: true, completion: nil)
       self.rootVC = moviesList
    }
}
extension MoviesListCoordinator: MovieListVCDelegate {
    
    func personTableVCDidSelect(selected: Person) {
        let movieDetailsCoordinator = DetailsCoordinator(router: appRouter, person: selected, completion: { [weak self] in
            self?.movieDetailsCoordinator = nil
        })
        movieDetailsCoordinator.start()
        self.movieDetailsCoordinator = movieDetailsCoordinator
    }
}
