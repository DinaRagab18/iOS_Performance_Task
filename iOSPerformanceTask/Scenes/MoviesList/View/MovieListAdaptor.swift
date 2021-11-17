//
//  MovieListAdaptor.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class MoviesListAdapter: NSObject {
    var list = [Person]()
    
    var showEmptyState: ((Bool) -> Void)?
    
    func add(items: [Person]) {
       
        list.append(contentsOf: items)
        tableView?.reloadData()
    }
    
    func update(item: Person) {
        
    }
    
    //var list = [Person]()
    
    var tableView: UITableView?
    var reloadData:(() -> Void)?
    var loadMoreData:(() -> Void)?
    
    func add(item: Person) {
        
    }
    
    func count() -> Int {
        return list.count
    }
    func isLastIndex(index: IndexPath) -> Bool {
        return index.row == count()-1
    }
    
    func clear(reload: Bool) {
        
    }
    
    func setTableView(moviesTable: UITableView) {
         self.tableView = moviesTable
     }
    
    
    func getPerson(at index: Int) -> Person{
        return list[index]
    }
}
