//
//  ViewController.swift
//  HiraganaTraining
//
//  Created by 변경민 on 2020/04/12.
//  Copyright © 2020 변경민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Add IB Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    
    // when slider move
    @IBAction func isSliderMoved(_ sender: Any) {
        let questionCount:Int = Int(slider.value)
        valueLabel.text = String(questionCount)
    }
    
    @IBAction func startButton(_ sender: Any) {
        //Go to the Start
    }
    
}

