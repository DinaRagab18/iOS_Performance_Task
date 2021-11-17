//
//  BaseTableViewController.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import UIKit

class BaseTableViewController<Type: NSObject>: UITableViewController {
    var cellIdentifier: String?
    var adaptor: CustomAdaptor?
    var array: [Type]?
    var loadMoreDelegate: LoadMoreDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: cellIdentifier!,
        bundle: nil), forCellReuseIdentifier: cellIdentifier!)
        self.tableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
               
        self.tableView.delegate = self
       
        self.tableView.separatorStyle = .none

      
        
    }
    func setBaseTable(data: Type, cellIdentifier: String, loadMoreDelegate: LoadMoreDelegate){
        self.loadMoreDelegate = loadMoreDelegate
               self.cellIdentifier = cellIdentifier
        adaptor = CustomAdaptor()
        adaptor?.setTableView(moviesTable: self.tableView, type: data, cell: cellIdentifier)
        self.tableView.dataSource = adaptor
        self.tableView.delegate = self
    }
    
    func setList(array: [Type]){
        adaptor?.add(items: array)
    }
    
    // MARK: - Table view delegate
    
    func itemSelected(at index: Int) -> Type {
        return adaptor?.getItem(at: index) as! Type
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.loadMoreDelegate?.didSelect(at: indexPath.row)
    }
}

