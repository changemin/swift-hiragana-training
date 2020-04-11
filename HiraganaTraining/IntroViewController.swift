//
//  ViewController.swift
//  HiraganaTraining
//
//  Created by 변경민 on 2020/04/12.
//  Copyright © 2020 변경민. All rights reserved.
//

import Foundation
import UIKit

class IntroVC : UIViewController {

    // Add IB Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var questionCount:Int = 15
    
    // when slider move
    @IBAction func isSliderMoved(_ sender: Any) {
        questionCount = Int(slider.value)
        valueLabel.text = String(questionCount)
    }
    
    @IBAction func startButton(_ sender: Any) {
      //  self.navigationController?.pushViewController(TrainingVC, animated: true)
        toTraningVC()
    }
    
    private func toTraningVC(){
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let MainTraining = mainStoryBoard.instantiateViewController(identifier: "MainTraining") as? MainTraining else { return }
        
        
        MainTraining.QuestionCount = questionCount
        
        present(MainTraining, animated: true, completion: nil)
    }
    
}
    



