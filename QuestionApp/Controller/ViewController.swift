//
//  ViewController.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/08.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            //まるボタンが押されたとき
            
            //まるボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2 {
        //ばつボタンが押されたとき
            
        //バツボタンの音声を流す
            
        }
    }
    
    
}

