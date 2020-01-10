//
//  CountryCell.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit
import  Foundation
class CountryCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var captialLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!

    var country: CountryBaseModel? {
        didSet {
            setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData() {
        self.nameLabel.text = country?.name ?? ""
       // self.populationLabel.text = String(country?.population ?? 0)
        self.codeLabel.text = country?.numericCode ?? ""
        self.captialLabel.text = country?.capital ?? ""
        self.nativeNameLabel.text = country?.nativeName ?? ""
    }
    
    
    func validateCAMeterwtheCANO(cannumber: String,
                                 meterNo: String,
                                 mobileNo: String) -> Date {
        
    }
}
