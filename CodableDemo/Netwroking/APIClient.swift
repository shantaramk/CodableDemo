//
//  APIClient.swift
//  CodableDemo
//
//  Created by Shantaram K on 10/01/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class APIClient: NSObject {
    
    static func performRequest<T: Decodable>(route: APIConfiguration,
                                             successCompletion:@escaping (T) -> Void,
                                             failureCompletion:@escaping (Error) -> Void)  {
        
        let request = NSMutableURLRequest(url: NSURL(string: route.path)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10000.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.sync {
                
                if (error == nil) {
                    
                    do {
                        let decoder = JSONDecoder()
                        
                        let result = try decoder.decode(T.self, from: data!)
                        
                        successCompletion(result)
                        
                    } catch let error {
                        print("Decoding Error: \n", error)
                        failureCompletion(error)
                    }
                    
                }
            }
       
        })
        
        dataTask.resume()
    }
}


class APIConfiguration {
    
     var path: String {
        
        return "http://www.omdbapi.com/?s=Batman&page=1&apikey=eeefc96f"
    }
}
