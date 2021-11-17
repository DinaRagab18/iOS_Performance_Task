//
//  MovieListViewController+TableView.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

extension MovieListViewController: UITableViewDelegate {

    func setupTableView() {
        movieTableView.dataSource = movieAdaptor
        movieTableView.delegate = self
        movieTableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }

}

extension MovieListViewController: LoadMoreDelegate {
    func loadMore() {
        self.presenter.viewDidLoad()
    }
    
    func didSelect(at index: Int) {
         let person = baseVC.itemSelected(at: index)
         presenter.didSelectRow(person: person as! Person)
    }
  
}
