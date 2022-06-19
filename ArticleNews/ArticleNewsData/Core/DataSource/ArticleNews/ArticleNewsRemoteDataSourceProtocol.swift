//
//  ArticleNewsRemoteDataSourceProtocol.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

protocol ArticleNewsRemoteDataSourceProtocol {
    
    func getTopStoryIDs(completion: @escaping (Result<StoryIDResult, Error>) -> Void)
    
    func getNewsStoryIDs(completion: @escaping (Result<StoryIDResult, Error>) -> Void)
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void)
}
