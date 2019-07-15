//
//  toDoWorkCell.swift
//  ToDoApp
//
//  Created by TuanLA on 6/25/19.
//  Copyright © 2019 TuanLA. All rights reserved.
//

import UIKit

protocol ToDoWorkCellDelegate: AnyObject {
    func tapCompleted()
}

class ToDoWorkCell: UITableViewCell {
    
    weak var delegate: ToDoWorkCellDelegate?

    let lblWorkTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    let lblWorkDetail: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    let lblDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
        
        self.addSubview(lblWorkTitle)
        
        NSLayoutConstraint.activate([
            lblWorkTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            lblWorkTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            ])
        
        self.addSubview(lblWorkDetail)
        
        NSLayoutConstraint.activate([
            lblWorkDetail.leadingAnchor.constraint(equalTo: lblWorkTitle.leadingAnchor, constant: 0),
            lblWorkDetail.topAnchor.constraint(equalTo: lblWorkTitle.bottomAnchor, constant: 5),
            lblWorkDetail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -10)
            ])
        
        self.addSubview(lblDate)
        
        NSLayoutConstraint.activate([
            lblDate.centerYAnchor.constraint(equalTo: lblWorkTitle.centerYAnchor),
            lblDate.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
            ])
        
    }
    
    @objc func checkBoxIsDoneTapped() {
        delegate?.tapCompleted()
    }
    
//    func configCell(toDoWork: ToDoWork) {
//        lblWorkTitle.text = toDoWork.workTitle
//        lblWorkDetail.text = toDoWork.workDetail
//        
//        if toDoWork.completedDate != "" {
//            lblDate.text = toDoWork.completedDate
//        } else {
//        lblDate.text = toDoWork.createdDate
//        }
//    }
    
}
