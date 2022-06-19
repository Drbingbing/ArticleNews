//
//  NewStoriesViewModel.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/19.
//

import Foundation

final class NewStoriesViewModel: NewsStoriesViewModelProtocols {
    
    let interactor: ArticleNewsRemoteDataSourceProtocol
    
    init(interactor: ArticleNewsRemoteDataSourceProtocol) {
        self.interactor = interactor
    }
    
    var displayTitle: String? { return "New Stories" }
    
    
    func getNewStoryIds(completion: @escaping (Result<StoryIDResult, Error>) -> Void) {
        interactor.getNewsStoryIDs(completion: completion)
    }
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void) {
        interactor.getArticle(id, completion: completion)
    }
    
}
