//
//  MovieListProtocols.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import Moya

protocol MoviesListPresenterProtocol {

}

protocol MoviesListViewProtocol {
    func fetchDataSuccess(data:[Person])
   
}

protocol MoviesListModelProtocol {
    func getMovies(pageNumber:Int, completion: @escaping (
    _ result: Swift.Result<APIResponse<Person>, MoyaError>
    ) -> Void)
    func getModel() -> MovieListModel
}

protocol MovieListVCDelegate: AnyObject {
    func personTableVCDidSelect(selected: Person)
}
