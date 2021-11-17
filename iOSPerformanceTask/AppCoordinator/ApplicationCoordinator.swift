//
//  ApplicationCoordinator.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
   
    let window: UIWindow
    let rootVC: UINavigationController
    let movieListCoordinator: MoviesListCoordinator
    let appRouter: AppRouter
    
    init(window: UIWindow) {
        self.window = window
        self.rootVC = UINavigationController()
        self.appRouter = AppRouter(navigationController: rootVC)
        self.movieListCoordinator = MoviesListCoordinator(appRouter: appRouter)
        //self.moviesListCoordinator = MoviesListCoordinator(appRouter: appRouter)
    }
    
    func start() {
        window.rootViewController = appRouter.toPresentable()
        movieListCoordinator.start()
        window.makeKeyAndVisible()
    }
}
