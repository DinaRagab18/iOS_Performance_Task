//
//  LoadMoreDelegate.swift
//  MovieApp
//
//  Created by sara.galal on 11/22/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

protocol LoadMoreDelegate {
    func loadMore()
    func didSelect(at index: Int)
}
