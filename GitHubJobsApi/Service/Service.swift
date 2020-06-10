//
//  Service.swift
//  GitHubJobsApi
//
//  Created by Hadir Samir on 6/6/20.
//  Copyright © 2020 Hadir Samir. All rights reserved.
//

import Foundation
class Service{
    static let shared = Service()
    // function to retrieve an array of objects
    func getResults(description: String ,location: String,completed:@escaping (Result<[ResultsModel],ErrorMessage>) -> ()){
        let urlString = "https://jobs.github.com/positions.json?description=\(description.replacingOccurrences(of: " ", with: "+"))&location=\(location.replacingOccurrences(of: " ", with: "+"))"
        guard let url = URL(string:urlString) else{return}
        print(urlString)
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error{
                completed(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                // as keys are not the same of variables in the model
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode([ResultsModel].self, from: data)
                completed(.success(results))
                
            }catch{
                completed(.failure(.invalidResponse))
            }
        }
        task.resume()
    }
    
    //TODO:- function toretrieve an object
}
