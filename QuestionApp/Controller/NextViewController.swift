//
//  NextViewController.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/08.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import UIKit

protocol NowScoreDelegate {
    
    func nowScore(score: Int)
    
}

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    var delegate:NowScoreDelegate?
    
    //画面遷移時に渡された値を受け取るための変数
    var correctedCount = Int()
    var wrongCount = Int()
    
    var beforeCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)
        
        //beforeCount(キー値)で保存されている値をbeforeCountの変数の中に入れる
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        
    }
    
    //家ボタン押したら画面が戻る
    @IBAction func back(_ sender: Any) {
        //最高得点であれば入れ替え
        if beforeCount < correctedCount{
            //値を保存
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            //上で作ったデリゲートメソッドを呼び出す
            delegate?.nowScore(score: correctedCount)
        }else if beforeCount > correctedCount{ //そうでなければそのまま
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    

}
