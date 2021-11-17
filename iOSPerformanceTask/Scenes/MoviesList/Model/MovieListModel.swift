//
//  MovieListInteractor.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import Moya


class MovieListModel: NSObject, MoviesListModelProtocol {
    //  let appNetworkProvider = MoyaProvider<ActorsService>()
    func getMovies(pageNumber:Int, completion: @escaping (
        _ result: Swift.Result<APIResponse<Person>, MoyaError>
        ) -> Void){
        
        appNetworkProvider.request(.popular){
            result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(APIResponse<Person>.self, from: response.data)
                  //  print(result)
                   // result.results = []
                    completion(.success(result))
                } catch(let error) {
                    print(error)
                }
                
                
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func getModel() -> MovieListModel{
        return self
    }
    
    
}
