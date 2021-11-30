//
//  HomeViewController.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 20.11.2021.
//

import UIKit

class HomeViewController: BaseViewController, ServerInjected, CarListMapperInjected {
    
    private let carListView = CarListTableView()
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadingIndicator.startAnimating()
    }
    
    override func configure() {
        
        server.refreshInterval = 5
        server.observeChanges(self, selector: #selector(fetchNewCars(notification:)))
        loadingIndicator.color = .gray
        title = "Car List"
    }
    
    override func setupViews() {
        
        view.addSubview(carListView)
        view.addSubview(loadingIndicator)
        
        carListView.frame = view.bounds
        
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func fetchNewCars(notification: Notification) {
        
        guard let items = notification.userInfo?["items"] as? [AdModel] else { return }
        let mappedList = carListMapper.asViewModelList(items)
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.carListView.items = mappedList
        }
    }
}
