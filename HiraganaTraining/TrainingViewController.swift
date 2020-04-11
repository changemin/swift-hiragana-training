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
    
    @IBOutlet weak var QuestionCntLabel: UILabel!
    var maxQuestion:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionCntLabel.text = "\(maxQuestion!)"
    }
}
