//
//  XibView.swift
//  MovieApp
//
//  Created by sara.galal on 11/19/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import UIKit

@IBDesignable
class XibView : UIView {

    var contentView:UIView?
    var detailsView: CustomViewDetails?
    var detailsView2: DetailsView2?
    @IBInspectable var nibName:String?
    override func awakeFromNib() {
        super.awakeFromNib()
         xibSetup()
    }

    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
         view.frame = bounds
         view.autoresizingMask =
                    [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(
        withOwner: self,
        options: nil).first as? UIView
        if nibName == "CustomViewDetails" {
        self.detailsView = view as? CustomViewDetails
            self.detailsView?.imageLoaded = {
                print("imageLoaded")
            }
        }
        else if nibName == "DetailsView2" {
        self.detailsView2 = view as? DetailsView2
        }
        return view
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }
    func configureCustomView(item: Person) {
        detailsView?.setImage(path: item.profilePath ?? "")
        detailsView?.setName(name: item.name ?? "")
        detailsView?.setPopularity(popularity: item.popularity ?? 0)
        detailsView?.setKnownFor(knownFor: item.knownForDepartment ?? "")
    }
    func configureDetailsView2(item: Person) {
    detailsView2?.setImage(path: item.profilePath ?? "")
    detailsView2?.setName(name: item.name ?? "")
    detailsView2?.setPopularity(popularity: item.popularity ?? 0)
    detailsView2?.setKnownFor(knownFor: item.knownForDepartment ?? "")
    }
    
}
