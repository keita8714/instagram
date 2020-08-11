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
    var ID = String()
    
    @IBOutlet var textView: UITextView!
    var name:String!
    var com:String!
    override func viewDidLoad() {
        super.viewDidLoad()
   
       
    }
    
    @IBAction func button(_ sender: Any) {
         if let myid = Auth.auth().currentUser?.uid {
            var post:PostData!
            name = Auth.auth().currentUser?.displayName
            com =   "\(name):\(textView.text)"
            post?.comment.append(com)
        var updateValue:FieldValue
            updateValue = FieldValue.arrayUnion([myid])
            let postRef = Firestore.firestore().collection(Const.PostPath).document(ID)
            postRef.updateData(["comment": updateValue])
        }
        performSegue(withIdentifier: "Home", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeViewController
        homeViewController.a = textView.text
        homeViewController.b = ID
        
        
        
    }
   

}
