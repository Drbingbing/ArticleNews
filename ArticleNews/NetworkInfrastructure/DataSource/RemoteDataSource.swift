//
//  RemoteDataSource.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    func start() {
        
    }
    
    func articleNewsDataSource() -> ArticleNewsRemoteDataSourceProtocol {
        let client = ArticleNewsClient()
        
        return ArticleNewsRemoteDataSource(client: client)
    }
}
