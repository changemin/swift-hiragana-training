//
//  MainTraining.swift
//  HiraganaTraining
//
//  Created by 변경민 on 2020/04/12.
//  Copyright © 2020 변경민. All rights reserved.
//

import Foundation
import UIKit

class TrainingViewController:UIViewController{
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionN = 0
    var btn = [0,0,0,0]
    var maxQuestion:Int?
    var progressCnt = 0
    
    func generateQuestion() {
        questionN = Int.random(in: 1...50)
        for index in 0...3{
            btn[index] = Int.random(in: 1...4)
        }
    }
    
    func ObjectsUpdate(){
        question.text = String(questionN)
        btn1.setTitle(String(btn[0]), for: .normal)
        btn2.setTitle(String(btn[1]), for: .normal)
        btn3.setTitle(String(btn[2]), for: .normal)
        btn4.setTitle(String(btn[3]), for: .normal)
        
        progressBar.progress = progressCal()
    }
    
    func progressCal()->Float{
        return (progressCnt/maxQuestion)
    }
    
    func Submitted(){
        progressCnt += 1
        generateQuestion()
        ObjectsUpdate()
    }
    
    
    @IBAction func Button1(_ sender: Any) {
        Submitted()
    }
    @IBAction func Button2(_ sender: Any) {
        Submitted()
    }
    @IBAction func Button3(_ sender: Any) {
        Submitted()
    }
    @IBAction func Button4(_ sender: Any) {
        Submitted()
    }
}
