//
//  PostViewModel.swift
//  PostApp
//
//  Created by Ronald Chester Whigan on 5/15/23.
//

import Foundation

class PostViewModel {
    var postList: [PostModel]?
    
    func getPosts(closureHandler:@escaping ()->()) {
        ApiService.shared.getFromServer(url: Server.post.rawValue, closure: { [weak self] postList in
            
            self?.postList = postList
            DispatchQueue.main.async {
                closureHandler()
            }
        })
    }
}
