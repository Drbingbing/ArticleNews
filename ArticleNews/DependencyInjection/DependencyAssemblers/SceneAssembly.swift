//
//  SceneAssembly.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Swinject

final class SceneAssembly: Assembly {
    func assemble(container: Container) {
        
        let assemblies: [Assembly] = [
            ArticleNewsAssembly()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
}
