//
//  WebApiMock.swift
//  NewYorkTimesTests
//
//  Created by Zeeshan Badshah on 27/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import Foundation
@testable import NewYorkTimes

class WebApiMock {
    

    let mockFeeds : [String:Any] = [
        "status": "OK",
        "copyright": "Copyright (c) 2019 The New York Times Company.  All Rights Reserved.",
        "num_results": 1698,
        "results": [
            [
            "url": "https://www.nytimes.com/2019/02/19/us/politics/trump-investigations.html",
            "adx_keywords": "Trump, Donald J;Russian Interference in 2016 US Elections and Ties to Trump Associates;United States Politics and Government;Federal Bureau of Investigation;Justice Department;Barr, William P;Cohen, Michael D (1966- );Comey, James B;Flynn, Michael T;Mueller, Robert S III;Special Prosecutors (Independent Counsel)",
            "column": "",
            "section": "U.S.",
            "byline": "By MARK MAZZETTI, MAGGIE HABERMAN, NICHOLAS FANDOS and MICHAEL S. SCHMIDT",
            "type": "Article",
            "title": "Intimidation, Pressure and Humiliation: Inside Trump’s Two-Year War on the Investigations Encircling Him",
            "abstract": "President Trump’s efforts have exposed him to accusations of obstruction of justice as Robert S. Mueller III, the special counsel, finishes his work.",
            "published_date": "2019-02-19",
            "source": "The New York Times",
            "id": 100000006356375,
            "asset_id": 100000006356375,
            "views": 1,
            "des_facet": [
                "RUSSIAN INTERFERENCE IN 2016 US ELECTIONS AND TIES TO TRUMP ASSOCIATES",
                "UNITED STATES POLITICS AND GOVERNMENT"
            ],
            "org_facet": [
                "FEDERAL BUREAU OF INVESTIGATION",
                "JUSTICE DEPARTMENT",
                "SPECIAL PROSECUTORS (INDEPENDENT COUNSEL)"
            ],
            "per_facet": [
                "TRUMP, DONALD J",
                "BARR, WILLIAM P",
                "COHEN, MICHAEL D (1966- )",
                "COMEY, JAMES B",
                "FLYNN, MICHAEL T",
                "MUELLER, ROBERT S III"
            ],
            "geo_facet": "",
            "media": [
                [
                "type": "image",
                "subtype": "photo",
                "caption": "President Trump entering the House chamber to deliver his State of the Union speech this month. Mr. Trump has attacked the law enforcement apparatus of his own government like no other president in history.",
                "copyright": "Doug Mills/The New York Times",
                "approved_for_syndication": 1,
                "media-metadata": [
                    [
                        "url": "https://static01.nyt.com/images/2019/02/17/us/politics/17dc-obstruction1/00dc-obstruction1-square320.jpg",
                        "format": "square320",
                        "height": 320,
                        "width": 320
                    ],
                    [
                        "url": "https://static01.nyt.com/images/2019/02/17/us/politics/17dc-obstruction1/00dc-obstruction1-thumbStandard.jpg",
                        "format": "Standard Thumbnail",
                        "height": 75,
                        "width": 75
                    ]
                ]
                ]
                ]
                
            ]
            
        ]
    ]
}

extension WebApiMock : WebApiProtocol{
    
    func getFeeds(filter: String, completion: @escaping (Feeds) -> ()) {
        
        var feeds = Feeds()
        do{
            
        let jsonData = try JSONSerialization.data(withJSONObject: mockFeeds, options: .prettyPrinted)
        
        
            let decoder = JSONDecoder()
            feeds = try decoder.decode(Feeds.self, from: jsonData)
            
            completion(feeds)
            
        }catch {
            
            completion(feeds)
        }
        
    }
}
