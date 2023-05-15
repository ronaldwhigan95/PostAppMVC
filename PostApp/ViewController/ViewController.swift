//
//  ViewController.swift
//  PostApp
//
//  Created by Ronald Chester Whigan on 5/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var postList: [PostModel]?

    @IBOutlet weak var postsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return postList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let thisCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell else {return UITableViewCell()}
        
        thisCell.setData(post: postList?[indexPath.row])
        
        return thisCell
    }
    
    func getPosts() {
        ApiService.shared.getFromServer(url: Server.post.rawValue, closure: { [weak self] postList in
            DispatchQueue.main.async {
                self?.postList = postList
                self?.postsTable.reloadData()
            }
        })
    }
}

