//
//  SoundFile.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/09.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(filename: String,extensionName: String){
        
        //再生する
        let soundURL = Bundle.main.url(forResource: filename, withExtension: extensionName)
        
        do {
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
        } catch  {//エラー出た時にこちらの処理になる
            print("エラーです！")
        }
        
    }
}
