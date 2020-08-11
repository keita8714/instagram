//
//  PostData.swift
//  instagram2
//
//  Created by Keita Munekawa on 2020/08/02.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var comment:[Comment] = []
    
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String

        self.caption = postDic["caption"] as? String
        
        if let Comments = postDic["comment"] as? [Comment]{
            self.comment = Comments
        }
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
        }
    
}
}
class Comment : NSObject{
    var text = String()
    var time = Int()
    var userId = String()
    
     init(document:QueryDocumentSnapshot) {
          let postDic = document.data()
        if let  Text = postDic["text"] as? String{
            self.text = Text
            
    }
}
}
