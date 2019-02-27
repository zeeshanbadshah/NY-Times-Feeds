//
//  WebApiProtocol.swift
//  NewYorkTimes
//
//  Created by Zeeshan Badshah on 27/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import Foundation

protocol WebApiProtocol {
    
    
    func getFeeds(filter: String, completion : @escaping(Feeds) ->())
}
