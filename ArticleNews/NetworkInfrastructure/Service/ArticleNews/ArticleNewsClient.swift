//
//  ArticleNews.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

final class ArticleNewsClient: APIClient, ArticleNewsClientProtocol {
    
    let session: URLSession

    // MARK: - Initializers

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        self.init(configuration: configuration)
    }
    
    // MARK: - Story IDs
    func getArticle(id: Int, completion: @escaping (Result<Article, APIError>) -> Void) {
        let request = ArticleNewsProvider.getArticle(id).request
        
        fetch(
            with: request,
            decode: { $0 as? Article },
            completion: completion
        )
    }
    
    func getTopStoryIDs(complteion: @escaping (Result<StoryIDResult, APIError>) -> Void) {
        let request = ArticleNewsProvider.getTopStories.request
        
        fetch(
            with: request,
            decode: { json -> StoryIDResult? in
                return json as? StoryIDResult
            },
            completion: complteion
        )
    }
    
    func getNewsStoryIDs(complteion: @escaping (Result<StoryIDResult, APIError>) -> Void) {
        let request = ArticleNewsProvider.getNewStories.request
        
        fetch(
            with: request,
            decode: { json -> StoryIDResult? in
                return json as? StoryIDResult
            },
            completion: complteion
        )
    }
}
