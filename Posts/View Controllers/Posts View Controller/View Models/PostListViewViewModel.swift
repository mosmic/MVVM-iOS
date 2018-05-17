//
//  PostListViewViewModel.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 14/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

public class PostListViewViewModel {
    private let postProvider: PostRemoteRepository
    
    private let page = MutableProperty<Int>(1)
    private let limit = MutableProperty<Int>(20)
    
    private let _posts = MutableProperty<[PostViewViewModel]>([])
    
    public var fetchPosts: Action<Void, [PostViewViewModel], RemoteProviderError>!
    public var posts: Property<[PostViewViewModel]>
    
    public init(postProvider: PostRemoteRepository) {
        
        self.postProvider = postProvider
        self.posts = Property<[PostViewViewModel]>(_posts)
        
        self.fetchPosts = Action<Void, [PostViewViewModel], RemoteProviderError> { _ -> SignalProducer<[PostViewViewModel], RemoteProviderError> in
            
            let producer = postProvider
                .fetchPosts(page: self.page.value, limit: self.limit.value)
                .map { list -> [PostViewViewModel] in
                    return list.map { PostViewViewModel(post: $0) }
                }
            
            return producer
        }
        
        _posts <~ fetchPosts.values.map { self._posts.value + $0  }
        
    }

}
