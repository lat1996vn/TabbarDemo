//
//  SearchVC.swift
//  TabbarDemo
//
//  Created by TuanLA on 7/10/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        //        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let cltv = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        cltv.translatesAutoresizingMaskIntoConstraints = false
        cltv.allowsSelection = false
        //tbv.separatorColor = .clear
        
        return cltv
    }()
    
    let searchBarTextField: PaddingTexField = {
        let tf = PaddingTexField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Search"
        tf.autocorrectionType = .no
        tf.returnKeyType = .search
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.gray.cgColor
        let imageView = UIImageView(image: #imageLiteral(resourceName: "icon_search"))
        
        tf.rightView = imageView
        tf.rightViewMode = .always
        return tf
    }()
    
    //--MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        layoutTableView()
        searchBarTextField.delegate = self
    }
    
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        print(collectionView.layer.frame.height)
//        print(getViewHeight())
//    }
    
    func layoutTableView() {
        self.title = "Search"
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }

}

extension SearchVC:  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            //cell.label.text = "#tag\(indexPath.row)"
            //cell.backgroundColor = .blue
        
        switch indexPath.row {
        case 0:
            cell.addSubview(searchBarTextField)
            
            NSLayoutConstraint.activate([
                searchBarTextField.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
                searchBarTextField.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -15),
                searchBarTextField.topAnchor.constraint(equalTo: cell.topAnchor, constant: 15),
                searchBarTextField.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
                searchBarTextField.widthAnchor.constraint(equalToConstant: collectionView.layer.frame.width - 40),
                searchBarTextField.heightAnchor.constraint(equalToConstant: 54 - 30)
                ])
        case 1:
            let tagVC = TagViewController()
            self.addChild(tagVC)
            cell.contentView.addSubview(tagVC.view)
            tagVC.view.translatesAutoresizingMaskIntoConstraints = false
            tagVC.didMove(toParent: self)
            NSLayoutConstraint.activate([
                tagVC.view.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                tagVC.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                tagVC.view.topAnchor.constraint(equalTo: cell.topAnchor),
                tagVC.view.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                tagVC.view.widthAnchor.constraint(equalToConstant: collectionView.layer.frame.width),
                tagVC.view.heightAnchor.constraint(equalToConstant: 140)
                ])
        case 2:
            let PopularAreaVC = PopularAreaViewController()
            self.addChild(PopularAreaVC)
            cell.contentView.addSubview(PopularAreaVC.view)
            PopularAreaVC.view.translatesAutoresizingMaskIntoConstraints = false
            PopularAreaVC.didMove(toParent: self)
            NSLayoutConstraint.activate([
                PopularAreaVC.view.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                PopularAreaVC.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                PopularAreaVC.view.topAnchor.constraint(equalTo: cell.topAnchor),
                PopularAreaVC.view.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                PopularAreaVC.view.widthAnchor.constraint(equalToConstant: collectionView.layer.frame.width),
                PopularAreaVC.view.heightAnchor.constraint(equalToConstant: 180)
                ])
        case 3:
            let AllAreaVC = AllAreaViewController()
            self.addChild(AllAreaVC)
            cell.contentView.addSubview(AllAreaVC.view)
            AllAreaVC.view.translatesAutoresizingMaskIntoConstraints = false
            AllAreaVC.didMove(toParent: self)
            NSLayoutConstraint.activate([
                AllAreaVC.view.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                AllAreaVC.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                AllAreaVC.view.topAnchor.constraint(equalTo: cell.topAnchor),
                AllAreaVC.view.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                AllAreaVC.view.widthAnchor.constraint(equalToConstant: collectionView.layer.frame.width),
                AllAreaVC.view.heightAnchor.constraint(equalToConstant: 180)
                ])
        default:
            break
        }
        
        return cell
    }
    
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let remainHeight = getViewHeight() - 554
        if remainHeight > 0 {
            return remainHeight/4
        }
        return 0
    }
    
    func getViewHeight() -> CGFloat {
        let navBarHeight = (self.navigationController?.navigationBar.intrinsicContentSize.height)!
            + UIApplication.shared.statusBarFrame.height
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0
        return UIScreen.main.bounds.height - navBarHeight - tabBarHeight
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBarTextField.resignFirstResponder()
        return true
    }
    
}
