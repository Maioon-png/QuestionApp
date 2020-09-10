//
//  ViewController.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/08.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NowScoreDelegate {


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
    
    var soundFile = SoundFile()
    
    var changeColor = ChangeColor()
    
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0 ,bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        //画面全体に広がってくれ
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        imageView.layer.cornerRadius = 20.0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        //最高得点のラベルに値を入れる
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        maxScoreLabel.text = String(maxScore)
        
    }

    
    @IBAction func answer(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            
            soundFile.playSound(filename: "maruSound", extensionName: "mp3")
            
            pickedAnswer = true
            
            //まるボタンが押されたとき
            
            //まるボタンの音声を流す
            
        }else if (sender as AnyObject).tag == 2 {
            
            soundFile.playSound(filename: "batsuSound", extensionName: "mp3")
            
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
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    //今のスコアを反映
    func nowScore(score: Int) {
        soundFile.playSound(filename: "sound", extensionName: "mp3")
        maxScoreLabel.text = String(score)
    }
    
    //画面遷移時に値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
        }
        
    }
    
    
}

