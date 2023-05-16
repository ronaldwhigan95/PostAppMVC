//
//  ViewController.swift
//  PostApp
//
//  Created by Ronald Chester Whigan on 5/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let viewModel = PostViewModel()

    @IBOutlet weak var postsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPosts {
            self.postsTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return viewModel.postList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let thisCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell else {return UITableViewCell()}
        
        thisCell.setData(post: viewModel.postList?[indexPath.row])
        
        return thisCell
    }
    
    
}

