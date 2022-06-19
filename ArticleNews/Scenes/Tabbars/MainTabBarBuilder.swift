//
//  Main.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/19.
//

import Foundation
import UIKit

final class MainTabBarBuilder {
    
    class func builderViewControllers() -> [UIViewController] {
        
        let topStoriesViewController = TopStoriesViewController()
        topStoriesViewController.viewModel = DIContainer.shared.resolve()
        let topStoryNavigationController = self.createNavigationController(title: "Top", image: UIImage(systemName: "star.fill"))
        topStoryNavigationController.pushViewController(topStoriesViewController, animated: false)
        
        let newStoriesViewController = NewStoriesViewController()
        newStoriesViewController.viewModel = DIContainer.shared.resolve()
        let newStoryNavigationController = self.createNavigationController(title: "News", image: UIImage(systemName: "newspaper.fill"))
        newStoryNavigationController.pushViewController(newStoriesViewController, animated: false)
        
        return [topStoryNavigationController, newStoryNavigationController]
    }
    
    class func createNavigationController(title: String, image: UIImage?) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }
}
