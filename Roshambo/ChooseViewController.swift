//
//  ChooseViewController.swift
//  Roshambo
//
//  Created by slchen on 2018/9/22.
//  Copyright © 2018 slchen. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {

    var userChoice: Choice = .scissors

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func choose(_ sender: UIButton) {
        let choice = Choice(rawValue: sender.tag)!

        switch choice {
        case .rock:
            userChoice = .rock
            showResultByCode()

        case .paper:
            userChoice = .paper
            showResultByCodeAndSegue()

        default:
            break;
        }
    }

    func showResultByCode() {
        let resultViewController: ResultViewController
        resultViewController = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.userChoice = userChoice
        present(resultViewController, animated: true, completion: nil)
    }

    func showResultByCodeAndSegue() {
        performSegue(withIdentifier: "showResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.userChoice = userChoice
        }
    }

}

