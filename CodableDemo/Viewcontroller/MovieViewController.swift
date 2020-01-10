//
//  MovieViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit
import Foundation

class MovieViewController: UIViewController {
    
    //MARK:- IBOutlet

    @IBOutlet weak var colletionView: UICollectionView!
    
    //MARK:- Properties
    
    var viewModel = MovieViewModel()
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callMovieListAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI()
    }


}


//MARK:- WebServies

extension MovieViewController {
    
    func callMovieListAPI() {
        
        MovieProxy.movieList(APIConfiguration(),
                             successCompletion: { (result) in
                                
                                self.viewModel.movies = result.movie ?? []
                                
                                self.colletionView.reloadData()

        }) { (error) in
            
            print(error)
        }
    }
 
}
