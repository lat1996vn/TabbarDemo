//
//  TagViewController.swift
//  TabbarDemo
//
//  Created by TuanLA on 7/16/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class TagViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let tagList = ["泊まる(223)","おすすめ(213)","食べる(180)","自然(166)","温泉(132)","観光する(300)","景色・鑑賞(104)","ホテル(100)"]
    
    let trendingTagLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.text = "Trending Hashtag"
        return lbl
    }()
    
    let line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 300, height: 40)
        let cltv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cltv.translatesAutoresizingMaskIntoConstraints = false
        
        return cltv
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: "tagcell")
        collectionView.isScrollEnabled = false
        setupView()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagcell", for: indexPath) as? TagCell {
            cell.tagButton.setTitle("#\(tagList[indexPath.row])", for: .normal)
            print(cell.layer.bounds.height)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func setupView() {
        view.addSubview(trendingTagLable)
        NSLayoutConstraint.activate([
            trendingTagLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trendingTagLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 3),
            ])
        
        view.addSubview(line)
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.topAnchor.constraint(equalTo: trendingTagLable.bottomAnchor, constant: 5)
            ])
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 90)
            ])
    }

}
