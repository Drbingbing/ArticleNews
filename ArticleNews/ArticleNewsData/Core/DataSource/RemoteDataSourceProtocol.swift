//
//  RemoteDataSourceProtocol.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

protocol RemoteDataSourceProtocol {
    
    func start()
    
    func articleNewsDataSource() -> ArticleNewsRemoteDataSourceProtocol
}
