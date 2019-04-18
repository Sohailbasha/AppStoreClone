//
//  APIService.swift
//  AppStoreClone
//
//  Created by Ilias Basha on 4/18/19.
//  Copyright © 2019 sohail. All rights reserved.
//

import Foundation

class APIService {
    
    static let sharedInstance = APIService()
    
    func fetchApps(completion: @escaping ([Result], Error?) -> ()) {
                let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
                guard let url = URL(string: urlString) else {
                    return
                }
                // fetch data from internet
                URLSession.shared.dataTask(with: url) { (data, response, err) in
                    if let err = err {
                        print("fail to fetch apps \(err)")
                        completion([], err)
                        return
                    }
        
                    // SUCCESS
                    guard let data = data else {
                        return
                    }
        
                    do {
                        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                        completion(searchResult.results, nil)
                    } catch let jsonError {
                        print("fail to decode json", jsonError)
                        completion([], jsonError)
                    }
        
                }.resume() // fires off the request
    }
    
}
