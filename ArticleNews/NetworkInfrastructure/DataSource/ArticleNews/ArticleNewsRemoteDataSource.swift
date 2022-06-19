//
//  ArticleNewsRemoteDataSource.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

final class ArticleNewsRemoteDataSource: ArticleNewsRemoteDataSourceProtocol {
    
    private let client: ArticleNewsClientProtocol
    
    init(client: ArticleNewsClientProtocol) {
        self.client = client
    }
    
    func getTopStoryIDs(completion: @escaping (Result<StoryIDResult, Error>) -> Void) {
        client.getTopStoryIDs { result in
            switch result {
            case .success(let ids):
                completion(.success(ids))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getNewsStoryIDs(completion: @escaping (Result<StoryIDResult, Error>) -> Void) {
        client.getNewsStoryIDs { result in
            switch result {
            case .success(let ids):
                completion(.success(ids))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getArticle(_ id: Int, completion: @escaping (Result<Article, Error>) -> Void) {
        client.getArticle(id: id) { result in
            switch result {
            case .success(let article):
                completion(.success(article))
            case .failure(let erorr):
                completion(.failure(erorr))
            }
        }
    }
}
