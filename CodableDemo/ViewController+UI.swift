//
//  ViewController+UI.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit

// MARK: - UI Methods

extension ViewController {
    
    func configureUI() {
        configureNavigationBar()
        setupTableview()
        configureView()
    }
    
    func configureView() {
        
    }
    
    func configureNavigationBar() {
        
    }
    
    func setupTableview() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "CountryCell", bundle: Bundle.main), forCellReuseIdentifier: "CountryCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}
