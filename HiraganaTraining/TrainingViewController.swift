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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Submitted(answer: -1)
        // 초기 리셋
    }
    
    var questionN = 0
    var btn = [0,0,0,0]
    var maxQuestion:Int?
    var progressCnt = 1
    var answerBtn = 0
    var score = 0
    
    func generateQuestion() {
        while checkOverlap() != 4{
            for i in 0...3{
                btn[i] = Int.random(in: 1...46)
            }
        }
        answerBtn = Int.random(in: 1...4)
        questionN = btn[answerBtn-1]
    }
    
    func checkOverlap() -> Int{
        var isOverlap = 0
        for i in 0...3{
            btn[i] = Int.random(in: 1...46)
            for j in 0...3{
                if btn[i] == btn[j] {
                    isOverlap += 1
                }
            }
        }
        return isOverlap
    }
    
    func ObjectsUpdate(){
        question.text = DICTIONARY_IDX_HIRAGANA[questionN]!
        btn1.setTitle(DICTIONARY_IDX_PRONOUNCE[btn[0]]!, for: .normal)
        btn2.setTitle(DICTIONARY_IDX_PRONOUNCE[btn[1]]!, for: .normal)
        btn3.setTitle(DICTIONARY_IDX_PRONOUNCE[btn[2]]!, for: .normal)
        btn4.setTitle(DICTIONARY_IDX_PRONOUNCE[btn[3]]!, for: .normal)
        progressBar.progress = progressCal()
    }
    
    func answerCheck(submitted userSelected:Int,answer ans:Int){
        if userSelected == ans{
            score += 1
            print("correct")
        }
        else {
            print("incorrect")
        }
    }
    
    func progressCal() -> Float{
        let percent = Float(progressCnt)/Float(maxQuestion!+1)
        if percent >= 1 {
            endExam()
        }
        return percent
    }
    
    func Submitted(answer userSelected:Int){
        if userSelected == -1 {
            generateQuestion()
            ObjectsUpdate()
            return
        }
        progressCnt += 1
        answerCheck(submitted: userSelected, answer: answerBtn)
        generateQuestion()
        ObjectsUpdate()
    }
    
    private func toResultViewController(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let resultVC = mainStoryBoard.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else { return }
        
        resultVC.score = score
        
        present(resultVC, animated: true, completion: nil)
    }

    func endExam(){
        // Go to the score
        print("Exam ended!")
        toResultViewController()
    }
    
    @IBAction func Button1(_ sender: Any) {
        Submitted(answer:1)
    }
    @IBAction func Button2(_ sender: Any) {
        Submitted(answer:2)
    }
    @IBAction func Button3(_ sender: Any) {
        Submitted(answer:3)
    }
    @IBAction func Button4(_ sender: Any) {
        Submitted(answer:4)
    }
}
