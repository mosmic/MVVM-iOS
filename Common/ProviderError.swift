//
//  ProviderError.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 16/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Foundation

public enum ProviderError: Swift.Error {
    case unknown
    case remote(RemoteProviderError)
}
