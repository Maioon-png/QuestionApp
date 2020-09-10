//
//  ChangeColor.swift
//  QuestionApp
//
//  Created by 岩崎舞 on 2020/09/09.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import Foundation
import UIKit

class ChangeColor {
    
    func changeColor(topR: CGFloat, topG: CGFloat, topB: CGFloat, topAlpha: CGFloat,bottomR: CGFloat, bottomG: CGFloat, bottomB: CGFloat, bottomAlpha: CGFloat)->CAGradientLayer{
        
        //グラデーションの返し色を決める
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
        
        //グラデーションの色を配列で管理する
        let gradientColor = [topColor.cgColor, bottomColor.cgColor]
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        
        return gradientLayer
    }
    
}
