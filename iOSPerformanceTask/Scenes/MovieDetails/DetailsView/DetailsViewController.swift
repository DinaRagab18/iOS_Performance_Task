//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Ibtikar on 2021.
//  Copyright © 2021 Ibtikar. All rights reserved.
//

import UIKit

class DetailsViewController: ViewController ,DetailsViewProtocol{

   @IBOutlet weak var detailsView: XibView!
   @IBOutlet weak var detailsView2: XibView!
    
    var presenter: DetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        self.navigationItem.hidesBackButton = true
                        let newBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(self.back(sender:)))
                        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    func setPresenter(presenter: DetailsPresenter) {
        self.presenter = presenter
    }
    
    func configureView() {
        if let item = presenter.getItem() {
        detailsView.configureCustomView(item: item)
        detailsView2.configureDetailsView2(item: item)
    }
    }
    
    @objc
        func back(sender: UIBarButtonItem) {
            self.presenter.popView()
            }
}
