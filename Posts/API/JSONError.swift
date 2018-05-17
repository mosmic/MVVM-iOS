//
//  JSONError.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 14/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

public enum JSONError: Error {
    case invalidType(key: String)
    case invalidTypeOrMissingKey(key: String)
}
