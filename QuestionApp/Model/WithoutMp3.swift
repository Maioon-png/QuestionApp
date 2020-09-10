//
//  WithoutMp3.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/09.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import Foundation

class WithoutMp3: SoundFile{
    override func playSound(filename: String, extensionName: String) {
        
        if extensionName == "mp3"{
            
            print("このファイルは再生できません。")
            
        } 
        player?.stop()
    }
}
