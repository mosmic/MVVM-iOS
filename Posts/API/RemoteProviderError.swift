//
//  RemoteProviderError.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 14/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation

public enum RemoteProviderError: Error {
    case json(JSONError)
    case request(statusCode: Int?)
    case authenticationRefresh(NSError)
    case unknown
    
}
