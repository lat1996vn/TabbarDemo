//
//  imageCell.swift
//  TabbarDemo
//
//  Created by TuanLA on 7/16/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    let areaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    
        self.addSubview(areaImageView)
        NSLayoutConstraint.activate([
            areaImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            areaImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            areaImageView.topAnchor.constraint(equalTo: self.topAnchor),
            areaImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            areaImageView.heightAnchor.constraint(equalToConstant: 110),
            areaImageView.widthAnchor.constraint(equalToConstant: 110)
            ])
    }
}
