//
//  JSONDecodable.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 10/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation

public protocol JSONDecodable {
    static func parse(json: [String: Any]) throws -> Self
    static func parseList(json: [String: Any]) throws -> Array<Self>
}

extension JSONDecodable {
    public static var name: String {
        return String(describing: self)
    }
}
