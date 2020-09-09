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
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    //ここでImagesListが初期化される
    let imagesList = ImagesList()
    //検知した正答がどちらなのかを検知する変数
    var pickedAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
    }

    
    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            
            pickedAnswer = true
            
            //まるボタンが押されたとき
            
            //まるボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2 {
            
            pickedAnswer = false
            
        //ばつボタンが押されたとき
            
        //バツボタンの音声を流す
            
        }
        
        //チェック　回答が合っているか(pickedAnswer = falseとImagesListのcorrectOrNotの値が一致しているかどうか)
        check()
        nextQuestions()
    }
    
    func check(){
       
        let correctAnswer = imagesList.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("正解")
            correctCount = correctCount + 1
            
        }else{
            print("不正解")
            wrongCount = wrongCount + 1
            
        }
    }
    
    func nextQuestions(){
        
        if questionNumber <= 9{
            questionNumber = questionNumber + 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
        }else{
            print("問題終了")
            //画面遷移
            performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        }
    }
    
}

