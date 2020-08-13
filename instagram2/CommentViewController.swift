//
//  CommentViewController.swift
//  instagram2
//
//  Created by Keita Munekawa on 2020/08/02.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    var Post:PostData!
    
    @IBOutlet var textView: UITextView!
    var name:String!
    var com:String!

    override func viewDidLoad() {
        super.viewDidLoad()
   
       
    }
    
    @IBAction func button(_ sender: Any) {
        if let myid = Auth.auth().currentUser?.uid {
            name = Auth.auth().currentUser?.displayName
            com =   "\(name!):\(textView.text!)"
            
            
            var updateValue:FieldValue
            updateValue = FieldValue.arrayUnion([com])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(Post.id)
            print(updateValue)
            postRef.updateData(["comment":updateValue])
            dismiss(animated: true, completion: nil)
        }
       
    }
    }
