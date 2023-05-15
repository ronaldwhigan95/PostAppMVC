//
//  PostCell.swift
//  PostApp
//
//  Created by Ronald Chester Whigan on 5/15/23.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(post: PostModel?) {
        postTitle?.text = post?.title ?? "No results"
    }
    
}
