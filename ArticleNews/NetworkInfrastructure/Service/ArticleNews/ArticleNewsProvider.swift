//
//  ArticleNewsProvider.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

enum ArticleNewsProvider {
    
    case getTopStories
    
    case getNewStories
    
    case getArticle(_ id: Int)
}

extension ArticleNewsProvider: Endpoint {
    
    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }
    
    var path: String {
        switch self {
        case .getTopStories:
            return "/v0/topstories.json"
        case .getNewStories:
            return "/v0/newstories.json"
        case .getArticle(let id):
            return "/v0/item/\(id).json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTopStories, .getArticle, .getNewStories:
            return .get
        }
    }
}
