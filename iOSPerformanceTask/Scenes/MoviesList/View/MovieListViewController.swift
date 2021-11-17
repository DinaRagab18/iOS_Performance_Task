//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//
import UIKit


class MovieListViewController: ViewController, MoviesListViewProtocol {
    let baseVC =  BaseTableViewController()
    
    var  movieAdaptor = MoviesListAdapter()
    var presenter: MovieListPresenter!
    
    func fetchDataSuccess(data: [Person]) {
       baseVC.setList(array: data)
    }
    func setPresenter(presenter: MovieListPresenter) {
        self.presenter = presenter
    }
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var viewTable: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        //Mark: modification 
        baseVC.setBaseTable(data: presenter.getModel(),
                            cellIdentifier: MovieTableViewCell.identifier, loadMoreDelegate: self)

        viewTable.frame = baseVC.view.bounds
        viewTable.addSubview(baseVC.view)
        
        // Do any additional setup after loading the view.
        movieAdaptor.setTableView(moviesTable: movieTableView)
        presenter.viewDidLoad()
    }
}
