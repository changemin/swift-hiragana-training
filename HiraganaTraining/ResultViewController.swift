//
//  ResultViewController.swift
//  HiraganaTraining
//
//  Created by 변경민 on 2020/04/12.
//  Copyright © 2020 변경민. All rights reserved.
//

import Foundation
import UIKit


class ResultViewController: UIViewController{
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score!)
        print(score!)
    }
    
    private func toIntroViewController(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let introVC = mainStoryBoard.instantiateViewController(identifier: "IntroViewController") as? IntroViewController else { return }
        
        present(introVC, animated: true, completion: nil)
    }
    @IBAction func retryButton(_ sender: Any) {
        toIntroViewController()
    }
}
