//
//  DataSourceAssember.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Swinject

final class DataSourceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RemoteDataSourceProtocol.self) { _ in
            return RemoteDataSource()
        }
    }
    
}
