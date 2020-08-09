//
//  CommentViewController.swift
//  instagram2
//
//  Created by Keita Munekawa on 2020/08/02.
//  Copyright © 2020 KM. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    var ID = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeViewController
        
        
        
    }
   

}
