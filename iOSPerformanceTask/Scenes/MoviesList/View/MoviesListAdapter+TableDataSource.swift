//
//  MoviesListAdapter+TableDataSource.swift
//  MovieApp
//
//  Created by Ahmed Refaat on 11/11/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

extension MoviesListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if list.isEmpty {
           return 3
        }
        return count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if list.isEmpty{

        } else {
     
      if let cell = tableView.dequeueReusableCell(
                       withIdentifier: MovieTableViewCell.identifier,
                       for: indexPath) as? MovieTableViewCell
                       //configure the cell
      {
        //Mark : modification
        cell.selectionStyle = .default
        cell.configureCell(item: list[indexPath.row])
         return cell
    }
 }
    return UITableViewCell()
     
    }
}

