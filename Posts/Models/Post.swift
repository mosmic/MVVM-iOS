//
//  Post.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 10/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation

typealias Posts = [Post]

public struct Post: Codable {
    public let id: Int
    public let userId: Int
    public let title: String
    public let body: String
}
