//
//  Human.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/09.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import Foundation

class Human:Animal{
    
    override func breath() {
        super.breath()
        profile()
    }
    
    func profile(){
        print("私は人間です！")
    }
}
