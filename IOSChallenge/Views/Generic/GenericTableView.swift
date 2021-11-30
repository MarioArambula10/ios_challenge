//
//  GenericTableView.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import UIKit

class GenericTableView<T, U: GenericTableViewCell<T>>: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    private let cellID = String(describing: U.self)
    
    var items: [T] = [] {
        didSet {
            reloadData()
        }
    }
    
    init() {
        
        super.init(frame: .zero, style: .plain)
        register(U.self, forCellReuseIdentifier: cellID)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? U else { return UITableViewCell() }
        cell.item = items[safe: indexPath.row]
        return cell
    }
}
