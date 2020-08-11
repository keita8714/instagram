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
    var post:PostData? = nil
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
       
    }
    
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "Home", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeViewController
        homeViewController.a = textView.text
        homeViewController.b = ID
        
        
        
    }
   

}
