//
//  MovieListPresenter.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation

class MovieListPresenter: MoviesListPresenterProtocol {
    
    var view: MoviesListViewProtocol
    var model: MoviesListModelProtocol
    var page = 1
    weak var movieListVCDelegate : MovieListVCDelegate?
    
    init(model: MoviesListModelProtocol, view: MoviesListViewProtocol) {
        self.view = view
        self.model = model
    }
    
    func setDelegate(delegate: MovieListVCDelegate) {
        print("movie Delegate", delegate)
       movieListVCDelegate = delegate
    }
    
    func getModel() -> MovieListModel{
        return model.getModel()
    }
    
    func viewDidLoad() {
        //Mark : Modified
       model.getMovies(pageNumber: page,  completion: { [weak self] (result) in
        guard let self = self else { return }
            switch result {
            case .success(let response):
                if (response.results!.isEmpty){
                    print ("empty view")
                }else{
                self.view.fetchDataSuccess(data: response.results ?? [Person]())
                //print("response Results" , response.results)
                }
            case .failure(let error):
                print(error)
                
                
            }
            
        })
//        if page == 5 {
//          
//           }
            page += 1
    }
    func didSelectRow(person: Person) {
        let person = person
        movieListVCDelegate?.personTableVCDidSelect(selected: person)
    }
}
