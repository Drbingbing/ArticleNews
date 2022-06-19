//
//  ArticleNewsClientProtocol.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

protocol ArticleNewsClientProtocol {
    
    func getArticle(id: Int, completion: @escaping (Result<Article, APIError>) -> Void)
    
    func getTopStoryIDs(complteion: @escaping (Result<StoryIDResult, APIError>) -> Void)
    
    func getNewsStoryIDs(complteion: @escaping (Result<StoryIDResult, APIError>) -> Void)
}
