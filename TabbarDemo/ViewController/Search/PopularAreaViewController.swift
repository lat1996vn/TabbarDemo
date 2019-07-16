//
//  PopularAreaViewController.swift
//  TabbarDemo
//
//  Created by TuanLA on 7/16/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class PopularAreaViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let popularAreaLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.text = "Popular Area"
        return lbl
    }()
    
    let line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 150, height: 110)
        let cltv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cltv.translatesAutoresizingMaskIntoConstraints = false
        cltv.showsHorizontalScrollIndicator = false
        return cltv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "imagecell")
        setupView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagecell", for: indexPath) as? ImageCell {
            cell.areaImageView.image = #imageLiteral(resourceName: "tokyo")
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func setupView() {
        view.addSubview(popularAreaLabel)
        NSLayoutConstraint.activate([
            popularAreaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popularAreaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 3),
            ])
        
        view.addSubview(line)
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.topAnchor.constraint(equalTo: popularAreaLabel.bottomAnchor, constant: 5)
            ])
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 110)
            ])
    }
    
}
