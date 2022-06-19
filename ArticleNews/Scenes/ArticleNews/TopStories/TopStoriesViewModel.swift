//
//  TopStoriesViewModel.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation
import UIKit

final class TopStoriesViewModel: TopStoriesViewModelProtocol {
    
    let interactor: ArticleNewsRemoteDataSourceProtocol
    
    init(interactor: ArticleNewsRemoteDataSourceProtocol) {
        self.interactor = interactor
    }
    
    var displayTitle: String? { return "Top Stories" }
    
    
    func getTopStoryIds(completion: @escaping (Result<StoryIDResult, Error>) -> Void) {
        interactor.getTopStoryIDs(completion: completion)
    }
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void) {
        interactor.getArticle(id, completion: completion)
    }
}
