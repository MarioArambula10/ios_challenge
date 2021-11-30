//
//  CarListTableView.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import UIKit

class CarListTableView: GenericTableView<CarListViewModel, CarListTableViewCell> {
    
    override init() {
        
        super.init()
        estimatedRowHeight = 200
        rowHeight = UITableView.automaticDimension
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
