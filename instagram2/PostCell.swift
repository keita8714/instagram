//
//  PostCell.swift
//  instagram2
//
//  Created by Keita Munekawa on 2020/08/11.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
class PostCell: UITableViewCell {
    var homeViewController:HomeViewController?
    var name:String!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var captionLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    var post:PostData?
    var S:[String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        name = Auth.auth().currentUser?.displayName
        if post?.comment != nil {
            S = post?.comment as! [String]
            commentLabel.text = "\(S)"
        }else{
            commentLabel.text = "コメント欄"
        }
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // PostDataの内容をセルに表示
       func setPostData(_ postData: PostData) {
           // 画像の表示
           postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
           let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
           postImageView.sd_setImage(with: imageRef)

           // キャプションの表示
           self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"

           // 日時の表示
           self.dateLabel.text = ""
           if let date = postData.date {
               let formatter = DateFormatter()
               formatter.dateFormat = "yyyy-MM-dd HH:mm"
               let dateString = formatter.string(from: date)
               self.dateLabel.text = dateString
           }

           // いいね数の表示
           let likeNumber = postData.likes.count
           likeLabel.text = "\(likeNumber)"

           // いいねボタンの表示
           if postData.isLiked {
               let buttonImage = UIImage(named: "like_exist")
               self.likeButton.setImage(buttonImage, for: .normal)
           } else {
               let buttonImage = UIImage(named: "like_none")
               self.likeButton.setImage(buttonImage, for: .normal)
           }
       }
}
