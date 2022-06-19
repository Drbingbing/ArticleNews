//
//  ArticleNewsListProtocol.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

protocol TopStoriesViewModelProtocol: ArticleNewsViewModelProtocol {
    
    func getTopStoryIds(completion: @escaping (Result<StoryIDResult, Error>) -> Void )
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void)
    
}


extension TopStoriesViewModelProtocol {
    
    func getIds(completion: @escaping ([Int]) -> Void) {
        self.getTopStoryIds { result in
            switch result {
            case .success(let ids):
                completion(ids)
            case .failure:
                completion([])
            }
        }
    }
    
}
