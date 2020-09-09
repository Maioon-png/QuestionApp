//
//  imagesModel.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/09.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import Foundation

class ImagesModel{
    //画像名を取得、その画像名が人間かそうでないかをフラグによって判定するための機能
    let imageText:String
    let answer:Bool
    //imegesModelを初期化＆値をもってくる
    init(imageName:String, correctOrNot:Bool){
        
        imageText = imageName
        
        answer = correctOrNot
        
    }
}
