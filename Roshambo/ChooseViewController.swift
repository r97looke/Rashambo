//
//  ChooseViewController.swift
//  Roshambo
//
//  Created by slchen on 2018/9/22.
//  Copyright © 2018 slchen. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func computerChoose() -> Choice {
        let rawValue = Int(arc4random() % 3)
        return Choice(rawValue: rawValue)!
    }

    @IBAction func choose(_ sender: UIButton) {
        let choice = Choice(rawValue: sender.tag)!
        let computerChoice = computerChoose();
        print("user choose \(choice), computer choose \(computerChoice)")
    }

}

