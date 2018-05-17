//
//  RemoteRepository.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 14/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import Alamofire
import Foundation


public class RemoteRepository {
    let sessionManager: SessionManager
    
    public init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
}
