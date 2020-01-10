//
//  MovieViewController+UITableView.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit


// MARK: - UICollectionView Delegate

extension MovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.viewModel.movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else {fatalError("Unable to find Appropriate TableViewCell")}
        
        cell.tag = indexPath.row
        
        cell.movie = self.viewModel.movies[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailView = AppStoryboard.main.instantiateVC(viewControllerClass: MovieDetailViewController.self)
        
        detailView.movie = self.viewModel.movies[indexPath.row]
        
        self.navigationController?.pushViewController(detailView, animated: true)
        
    }
    
}
