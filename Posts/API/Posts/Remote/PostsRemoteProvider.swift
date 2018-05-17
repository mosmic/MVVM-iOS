//
//  PostsRemoteProvider.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 14/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveSwift
import AlamofireReactiveExtensions
import Result

public protocol PostRemoteProvider {
    func fetchPost(id: Int) -> SignalProducer<Post?, RemoteProviderError>
    func fetchPosts(page: Int, limit: Int) -> SignalProducer<[Post], RemoteProviderError>
}

public class PostRemoteRepository {
    public init() {}
    
    public func fetchPost(id: Int) -> SignalProducer<Post?, RemoteProviderError> {
        return SignalProducer<Post?, RemoteProviderError> { observer, lifetime in
            Alamofire.request(PostRouter.fetchPost(id)).response { (dataResponse) in
                if let data = dataResponse.data {
                    let post = try? JSONDecoder().decode(Post.self, from: data)
                    observer.send(value: post)
                    observer.sendCompleted()
                } else {
                    observer.send(error: RemoteProviderError.request(statusCode: dataResponse.response?.statusCode))
                }
            }
        }
    }
    
    public func fetchPosts(page: Int, limit: Int) -> SignalProducer<[Post], RemoteProviderError> {
        return SignalProducer<[Post], RemoteProviderError> { observer, lifetime in
            Alamofire.request(PostRouter.fetchPosts(page, limit)).response { (dataResponse) in
                if dataResponse.response?.statusCode == 200 {
                    if let data = dataResponse.data {
                        let posts = try? JSONDecoder().decode(Posts.self, from: data)
                        observer.send(value: posts ?? [])
                        observer.sendCompleted()
                    }
                }
                 else {
                    observer.send(error: RemoteProviderError.request(statusCode: dataResponse.response?.statusCode))
                }
            }
        }
    }
    
//    public func fetchPost(id: Int) -> SignalProducer<Post, RemoteProviderError> {
//        return Alamofire.request(PostRouter.fetchPost(id))
//            .reactive
//            .responseData()
//            .promoteError(RemoteProviderError.self)
//            .attemptRemoteMap()
//            .attemptJsonDecode(Post.self)
//    }
//
//    public func fetchPosts(page: Int, limit: Int) -> SignalProducer<[Post], RemoteProviderError> {
//        return Alamofire.request(PostRouter.fetchPosts(page, limit))
//            .reactive
//            .responseData()
//            .promoteError(RemoteProviderError.self)
//            .attemptRemoteMap()
//            .attemptJsonDecode(Array<Post>.self)
//    }
}

extension PostRemoteRepository: PostRemoteProvider {}
