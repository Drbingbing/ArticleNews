//
//  ArticleNewsViewModelProtocol.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/19.
//

import Foundation
import UIKit

protocol ArticleNewsViewModelProtocol {
    
    var displayTitle: String? { get }
    
    func open(url: String)
    
    func showComments(_ id: Int)
}

extension ArticleNewsViewModelProtocol {
    
    func open(url: String) {
        if let link = URL(string: url) {
            UIApplication.shared.open(link)
        }
    }
    
    func showComments(_ id: Int) {
        let baseCommentsURL = NetworkConfiguration.shared.commentsURLString
        
        let url = baseCommentsURL + "\(id)"
        
        if let link = URL(string: url) {
            UIApplication.shared.open(link)
        }
    }
}
