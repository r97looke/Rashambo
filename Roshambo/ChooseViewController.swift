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

    @IBAction func choose(_ sender: UIButton) {
        let choice = Choice(rawValue: sender.tag)!

        switch choice {
            case .rock:
                showResultByCode(.rock)
            default:
                break;
        }
    }

    func showResultByCode(_ userChoice: Choice) {
        let resultViewController: ResultViewController
        resultViewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.userChoice = userChoice
        present(resultViewController, animated: true, completion: nil)
    }

}

