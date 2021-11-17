//
//  CustomAdaptor.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import Foundation
import  UIKit


class CustomAdaptor: NSObject {
    typealias DataType = NSObject
    typealias Cell = UITableViewCell
    var cellIdentifier: String?
    var list = [DataType]()
    var type: DataType?
    func add(items: [DataType]) {
       
        list.append(contentsOf: items)
       
        tableView?.reloadData()
        
    }
    
    func update(item: Person) {
        
    }
    
    var tableView: UITableView?
    var reloadData:(() -> Void)?
    var loadMoreData:(() -> Void)?
    
    func add(item: Person) {
        
    }
    
    func count() -> Int {
        return list.count
    }

    func clear(reload: Bool) {
        
    }
    
    func setTableView(moviesTable: UITableView, type: DataType, cell: String) {
         self.tableView = moviesTable
        self.type = type
        self.cellIdentifier = cell
     }
    
    
    func getItem(at index: Int) -> DataType{
        return list[index]
    }
}

extension CustomAdaptor: UITableViewDataSource {
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
        withIdentifier: cellIdentifier!,
                       for: indexPath) as? Cell
                       //configure the cell
      {
     cell.configureCell(item: list[indexPath.row])
         return cell
    }
 }
    return UITableViewCell()
     
    }
}
