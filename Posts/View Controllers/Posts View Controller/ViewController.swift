//
//  ViewController.swift
//  Posts
//
//  Created by Dimitrios Vythoulkas on 10/05/2018.
//  Copyright © 2018 Dimitrios Vythoulkas. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class ViewController: UITableViewController {
    
    var viewModel: PostListViewViewModel? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = PostListViewViewModel(postProvider: PostRemoteRepository())
    }
    
    private func updateView() {
        
        if let viewModel = viewModel {
            viewModel.fetchPosts
                .apply()
                .startWithResult { result in
                    switch result {
                    case let .success(posts):
                        print(posts)
                        print(viewModel.posts.value)
                        
                    case let .failure(error):
                        print(error)
                    }
                    
                }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
