//
//  CommentTableViewCell.swift
//  instagram2
//
//  Created by Keita Munekawa on 2020/08/10.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet var userName: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var createdAt: UILabel!
    var homeViewController:HomeViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     func setPostData(_ postData: PostData) {
        self.userName.text = homeViewController.c
        self.commentLabel.text = homeViewController.a
        }
            
    
}

