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
    
    let cellViews: [UIView] = {
        let cellView1 = UIView()
        cellView1.translatesAutoresizingMaskIntoConstraints = false
        cellView1.backgroundColor = .white
        
        let cellView2 = UIView()
        cellView2.translatesAutoresizingMaskIntoConstraints = false
        cellView2.backgroundColor = .red
        
        let cellView3 = UIView()
        cellView3.translatesAutoresizingMaskIntoConstraints = false
        cellView3.backgroundColor = .blue
        
        let cellView4 = UIView()
        cellView4.translatesAutoresizingMaskIntoConstraints = false
        cellView4.backgroundColor = .green
        
        return [cellView1, cellView2, cellView3, cellView4]
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
        //imageView.contentMode = UIView.ContentMode.scaleAspectFill
        tf.rightViewMode = .always
        return tf
    }()
    
    let trendingTagLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.text = "Trending Hashtag"
        return lbl
    }()
    
    let popularAreaLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.text = "Popular Area"
        return lbl
    }()
    
    let popularAreaCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let allAreaLable: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        lbl.text = "All Area"
        return lbl
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
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(collectionView.layer.frame.height)
        print(getViewHeight())
//        searchBarTextField.textRect(forBounds: searchBarTextField.bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)))
//        searchBarTextField.placeholderRect(forBounds: searchBarTextField.bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)))
//        searchBarTextField.editingRect(forBounds: searchBarTextField.bounds.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)))
    }
    
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
            cell.addSubview(cellViews[indexPath.row])
            layoutCellView(cell: cell, index: indexPath.row)
            setupCell(index: indexPath.row)
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
    
    func layoutCellView(cell: UICollectionViewCell, index: Int) {
        NSLayoutConstraint.activate([
            cellViews[index].leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            cellViews[index].bottomAnchor.constraint(equalTo: cell.bottomAnchor),
            cellViews[index].topAnchor.constraint(equalTo: cell.topAnchor),
            cellViews[index].trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            cellViews[index].widthAnchor.constraint(equalToConstant: collectionView.layer.frame.width)
            ])
        switch index {
        case 0:
            cellViews[0].heightAnchor.constraint(equalToConstant: 54).isActive = true
        case 1:
            cellViews[index].heightAnchor.constraint(equalToConstant: 140).isActive = true
        case 2:
            cellViews[index].heightAnchor.constraint(equalToConstant: 180).isActive = true
        case 3:
            cellViews[index].heightAnchor.constraint(equalToConstant: 180).isActive = true
        default:
            break
        }
    }
    
    func setupCell(index: Int){
        switch index {
        case 0:
            
            cellViews[index].addSubview(searchBarTextField)
            NSLayoutConstraint.activate([
                searchBarTextField.centerXAnchor.constraint(equalTo: cellViews[index].centerXAnchor),
                searchBarTextField.centerYAnchor.constraint(equalTo: cellViews[index].centerYAnchor),
                searchBarTextField.topAnchor.constraint(equalTo: cellViews[index].topAnchor, constant: 15),
                searchBarTextField.leadingAnchor.constraint(equalTo: cellViews[index].leadingAnchor, constant: 20)
                ])
            
        case 1:
            cellViews[index].addSubview(trendingTagLable)
            NSLayoutConstraint.activate([
                trendingTagLable.centerXAnchor.constraint(equalTo: cellViews[index].centerXAnchor),
                trendingTagLable.topAnchor.constraint(equalTo: cellViews[index].topAnchor, constant: 3),
                ])
        case 2:
            cellViews[index].addSubview(popularAreaLable)
            NSLayoutConstraint.activate([
                popularAreaLable.centerXAnchor.constraint(equalTo: cellViews[index].centerXAnchor),
                popularAreaLable.topAnchor.constraint(equalTo: cellViews[index].topAnchor, constant: 3),
                ])
            
            
        case 3:
            cellViews[index].addSubview(allAreaLable)
            NSLayoutConstraint.activate([
                allAreaLable.centerXAnchor.constraint(equalTo: cellViews[index].centerXAnchor),
                allAreaLable.topAnchor.constraint(equalTo: cellViews[index].topAnchor, constant: 3),
                ])
        default:
            break
        }
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
