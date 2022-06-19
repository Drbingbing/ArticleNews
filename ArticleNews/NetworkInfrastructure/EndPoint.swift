//
//  EndPoint.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/17.
//

import Foundation

protocol Endpoint {

    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }

}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
