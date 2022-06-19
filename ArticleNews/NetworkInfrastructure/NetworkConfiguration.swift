//
//  NetworkConfiguration.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

final class NetworkConfiguration {
    
    static let shared = NetworkConfiguration()
    
    private init() {}
    
    var baseAPIURLString: String {
        return "https://hacker-news.firebaseio.com"
    }
    
    var commentsURLString: String {
        //    https://news.ycombinator.com/item?id=$id
        return "https://news.ycombinator.com/item?id="
    }
}
