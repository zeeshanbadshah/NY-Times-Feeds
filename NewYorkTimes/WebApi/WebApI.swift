//
//  WebApI.swift
//  NewYorkTimes
//
//  Created by Zeeshan Badshah on 27/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import Foundation

class WebAPI {
    
    final private let BASE_URL = "https://api.nytimes.com/svc/"
    final private let API_KEY = "MQLZqnC22plEFWoAXrhB1sWJwUAq9drm"
    
}

extension WebAPI : WebApiProtocol{
    
    func getFeeds(filter: String, completion : @escaping(Feeds) ->()) {
        
        var feedsResponse = Feeds()
        let url = URL(string: BASE_URL+filter+API_KEY)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200
            {
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        completion(feedsResponse)
                        return
                        
                }
                do{
                    
                    let decoder = JSONDecoder()
                    feedsResponse = try decoder.decode(Feeds.self, from: dataResponse)
                    completion(feedsResponse)
                    return
                    
                } catch let parsingError {
                    print("Error", parsingError)
                    completion(feedsResponse)
                    return
                }
            }
            
            print("Response Status Code not OK")
            completion(feedsResponse)
            return
        }
        task.resume()
        
    }
}
