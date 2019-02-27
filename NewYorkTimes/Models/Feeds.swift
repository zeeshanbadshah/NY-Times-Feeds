//
//  Feeds.swift
//  NewYorkTimes
//
//  Created by Zeeshan Badshah on 27/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import Foundation

import Foundation

struct Feeds: Codable {
    let status: String
    let results: [Result]
    
    init() {
        status = "ERROR"
        results = [Result]()
    }
}

struct Result: Codable {
    let url: String
    let section, byline, type, title: String
    let publishedDate, source: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case url, section, byline, type, title
        case publishedDate = "published_date"
        case source, media
    }
    
    init(from decoder : Decoder ) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.section = try container.decodeIfPresent(String.self, forKey: .section) ?? ""
        self.byline = try container.decodeIfPresent(String.self, forKey: .byline) ?? ""
        self.type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate) ?? ""
        self.source = try container.decodeIfPresent(String.self, forKey: .source) ?? ""
        self.media = try container.decodeIfPresent([Media].self, forKey: .media) ?? [Media]()
        
    }
}

struct Media: Codable {
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String
    
    init(from decoder : Decoder ) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
    }
}
