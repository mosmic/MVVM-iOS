//
//  PostViewViewModel.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 16/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation
import ReactiveSwift

public class PostViewViewModel {
    public let id: Property<Int>
    public let userId: Property<Int>
    public let title: Property<String?>
    public let body: Property<String?>
    
    public init(post: Post) {
        id = Property(value: post.id)
        userId = Property(value: post.userId)
        title = Property(value: post.title)
        body = Property(value: post.body)
    }
    
}
