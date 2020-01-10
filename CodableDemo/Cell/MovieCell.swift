//
//  MovieCell.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var pictureView: ImageLoader!
    @IBOutlet weak var cantainerView: UIView!
    @IBOutlet weak var titlaLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    var movie: Movie? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setData() {
        
        if let movie = movie {
            
            self.titlaLabel.text = movie.title ?? ""
            
            self.yearLabel.text = self.yearDifferece(movie.year ?? "") + "years ago"
            
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
    
    func yearDifferece(_ movieYear: String) -> String {
        if movieYear == "" {
            return ""
        }
        var difference = 0
        let calender = Calendar.current
        let year = calender.component(.year, from: Date())
        
        let yearList = movieYear.components(separatedBy: "–")
        if yearList.count == 2 {
            difference = year - Int(yearList[1])!
        } else {
            difference = year - Int(movieYear)!
        }
        
        return String(difference)
    }
    
}
