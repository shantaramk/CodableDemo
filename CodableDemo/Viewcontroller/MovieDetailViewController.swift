//
//  MovieDetailViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pictureView: ImageLoader!
    @IBOutlet weak var cantainerView: UIView!
    @IBOutlet weak var titlaLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!

    var movie: Movie? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Movie Detail"
    }

    func setData() {
        
        if let movie = movie {
            
            self.titlaLabel.text = movie.title ?? ""
            
            self.yearLabel.text = "Year: " + (movie.year ?? "")
            
            self.typeLabel.text = "Type: " + (movie.type ?? "")

            if let poster = movie.poster  {
                
                if let posterUrl = URL(string: poster) {
                    
                    self.pictureView.loadImageWithUrl(posterUrl)
                    
                } else {
                    self.pictureView.backgroundColor = .red
                }
                
            } else {
                self.pictureView.backgroundColor = .red
            }
            
        }
        
    }
 

}

enum AppStoryboard: String {
    
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func instantiateVC<T: UIViewController>(viewControllerClass: T.Type) -> T {
        
        //let storyboardID = (viewControllerClass as UIViewController.Type).storyboard
        let storyboardID =  String(describing: viewControllerClass.self)
        
        guard let viewObj = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            //throw ExcpectedError.intantiationErro(msg:"ViewController with identifier \(storyboardID)")
            fatalError()
        }
        return viewObj
    }
    
}
