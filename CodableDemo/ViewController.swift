//
//  ViewController.swift
//  CodableDemo
//
//  Created by Shantaram K on 06/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //MARK:- IBOutlet

    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    var countries = [CountryBaseModel]()
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureUI()
        fetchCountries()
    }


}



extension ViewController {
    
    func fetchCountries() {
        
        let headers = [
            "x-rapidapi-host": "ajayakv-rest-countries-v1.p.rapidapi.com",
            "x-rapidapi-key": "af042607f2mshcbc8ea33306ab8dp19f45djsn1a3f9c97820b",
            "cache-control": "no-cache",
            "postman-token": "5b3942d0-b1b7-32b2-cd9c-b53033469508"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://ajayakv-rest-countries-v1.p.rapidapi.com/rest/v1/all")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10000.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error == nil) {
                self.countryDecoding(data!)
            }
        })
        
        dataTask.resume()
    }
    
    func countryDecoding(_ data: Data) {
        /***  To perfrom Decoding Follow the below steps
                    1.copy the response from API
                    2. goto https://www.json4swift.com/ and past respone then click on generate button. you will get zip of reponse Model (CountryBaseModel)
                    3. add the model in project like in our case CountryBaseModel
                */
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode([CountryBaseModel].self, from: data)
            self.countries = result
            relaodTableOnMainThread()
        } catch let error {
            print("Decoding Error: \n", error)
        }
    }
    
    func relaodTableOnMainThread() {
        DispatchQueue.main.sync {
            self.tableView.reloadData()
        }
    }
}
