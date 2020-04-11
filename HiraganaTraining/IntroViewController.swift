//
//  ViewController.swift
//  HiraganaTraining
//
//  Created by 변경민 on 2020/04/12.
//  Copyright © 2020 변경민. All rights reserved.
//

import Foundation
import UIKit

class IntroViewController : UIViewController {

    // Add IB Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var sliderValue:Int = 15
    
    // when slider move
    @IBAction func isSliderMoved(_ sender: Any) {
        sliderValue = Int(slider.value)
        valueLabel.text = String(sliderValue)
    }
    
    @IBAction func startButton(_ sender: Any) {
        toTraningViewController()
    }
    
    private func toTraningViewController(){
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let trainingVC = mainStoryBoard.instantiateViewController(identifier: "TrainingViewController") as? TrainingViewController else { return }
        
        trainingVC.maxQuestion = sliderValue
        
        present(trainingVC, animated: true, completion: nil)
    }
    
}
    



