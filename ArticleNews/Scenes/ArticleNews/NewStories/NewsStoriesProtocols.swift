//
//  NewsStoriesProtocols.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/19.
//

import Foundation


protocol NewsStoriesViewModelProtocols: ArticleNewsViewModelProtocol {
    
    func getNewStoryIds(completion: @escaping (Result<StoryIDResult, Error>) -> Void )
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void)
}

extension NewsStoriesViewModelProtocols {
    
    func getIds(completion: @escaping ([Int]) -> Void) {
        self.getNewStoryIds { result in
            switch result {
            case .success(let ids):
                completion(ids)
            case .failure:
                completion([])
            }
        }
    }
}
