//
//  BaseViewController.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 20.11.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configure()
        setupViews()
    }
    
    // MARK: Setup

    func configure() {
        // override as needed
    }

    func setupViews() {
        // override as needed
    }
}
