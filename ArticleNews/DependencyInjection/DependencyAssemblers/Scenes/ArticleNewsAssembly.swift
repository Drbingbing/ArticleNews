//
//  ArticleNewsAssembly.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Swinject

final class ArticleNewsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(TopStoriesViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(RemoteDataSourceProtocol.self) else {
                fatalError("ArticleNewsRemoteDataSourceProtocol dependency could not be resolved")
            }
            
            return TopStoriesViewModel(interactor: interactor.articleNewsDataSource())
        }
        
        container.register(NewsStoriesViewModelProtocols.self) { resolver in
            guard let interactor = resolver.resolve(RemoteDataSourceProtocol.self) else {
                fatalError("ArticleNewsRemoteDataSourceProtocol dependency could not be resolved")
            }
            
            return NewStoriesViewModel(interactor: interactor.articleNewsDataSource())
        }
    }
}
