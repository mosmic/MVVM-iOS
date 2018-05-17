//
//  PostRouter.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 14/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation
import Alamofire

enum PostRouter: URLRequestConvertible {
    case fetchPosts(Int, Int)
    case fetchPost(Int)
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchPosts(_, _):
            return URLEncoding.default
        case .fetchPost(_):
            return URLEncoding.default
        }
    }
    
    var requestConfiguration: (path: String, parameters: [String: Any]?, body: [String: Any]?) {
        switch self {
        case .fetchPosts(let page, let limit):
            return (
                path: "posts",
                parameters: [
                    "_page": page as AnyObject,
                    "_limit": limit as AnyObject
                ],
                body: nil
            )
            
        case .fetchPost(let id):
            return (
                path: "posts/\(id)",
                parameters: nil,
                body: nil
            )
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        let config = self.requestConfiguration
        let url = try API.BaseURL.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(config.path))
        
        request.httpMethod = method.rawValue
        request = try encoding.encode(request, with: config.body)
        request = try URLEncoding(destination: .queryString,
                                  arrayEncoding: .brackets,
                                  boolEncoding: .numeric).encode(request, with: config.parameters)
        
        return request
    }
}
