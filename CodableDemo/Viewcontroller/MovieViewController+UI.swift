//
//  MovieViewController+UI.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit

// MARK: - UI Methods

extension MovieViewController {
    
    func configureUI() {
        configureNavigationBar()
        setupTableview()
        configureView()
    }
    
    func configureView() {
        
    }
    
    func configureNavigationBar() {
        self.navigationController?.navigationBar.topItem?.title = "Movies"
    }
    
    func setupTableview() {
        self.colletionView.register(UINib(nibName: "MovieCell", bundle: Bundle.main), forCellWithReuseIdentifier: "MovieCell")
        self.colletionView.delegate = self
        self.colletionView.dataSource = self
        self.colletionView.backgroundColor = UIColor.gray
        self.colletionView.reloadData()
        collectionFlowLayout()
    }
    
    func collectionFlowLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let widthConstant = 2
        let layoutHeight: CGFloat =   UIScreen.main.bounds.width  / CGFloat(widthConstant)
        let layoutWidth = layoutHeight
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0.1
        layout.scrollDirection = .vertical
        self.colletionView.isScrollEnabled = true
        self.colletionView!.collectionViewLayout = layout
    }
}
