//
//  ResultViewController.swift
//  Roshambo
//
//  Created by slchen on 2018/9/22.
//  Copyright © 2018 slchen. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var userChoice: Choice!
    var computerChoice: Choice!
    var result: Result!

    enum Result {
        case tie, rock_paper_user_win, rock_paper_user_lose, rock_scissor_user_win, rock_scissor_user_lose, paper_scissor_user_win, paper_scissor_user_lose
    }

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        computerChoice = computerChoose()
        result = getResult(userChoice: userChoice, computerChoice: computerChoice)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(result)
    }

    func computerChoose() -> Choice {
        let rawValue = Int(arc4random() % 3)
        return Choice(rawValue: rawValue)!
    }

    func getResult(userChoice: Choice, computerChoice: Choice) -> Result {
        if userChoice == computerChoice {
            return .tie
        } else if userChoice == .rock {
            if computerChoice == .paper {
                return .rock_paper_user_lose
            } else {
                return .rock_scissor_user_win
            }
        } else if userChoice == .paper {
            if computerChoice == .rock {
                return .rock_paper_user_win
            } else {
                return .paper_scissor_user_lose
            }
        } else {
            if computerChoice == .rock {
                return .rock_scissor_user_lose
            } else {
                return .paper_scissor_user_win
            }
        }
    }

    func configureUI(_ result: Result) {
        switch result {
        case .tie:
            resultImageView.image = UIImage(named: "itsATie")
            resultLabel.text = "It's a tie"

        case .rock_paper_user_win:
            resultImageView.image = UIImage(named: "PaperCoversRock")
            resultLabel.text = "Paper covers rock. You win!"

        case .rock_paper_user_lose:
            resultImageView.image = UIImage(named: "PaperCoversRock")
            resultLabel.text = "Paper covers rock. You lose!"

        case .rock_scissor_user_win:
            resultImageView.image = UIImage(named: "RockCrushesScissors")
            resultLabel.text = "Rock crushes scissors. You win!"

        case .rock_scissor_user_lose:
            resultImageView.image = UIImage(named: "RockCrushesScissors")
            resultLabel.text = "Rock crushes scissors. You lose!"

        case .paper_scissor_user_win:
            resultImageView.image = UIImage(named: "ScissorsCutPaper")
            resultLabel.text = "Scissors cut paper. You Win!"

        case .paper_scissor_user_lose:
            resultImageView.image = UIImage(named: "ScissorsCutPaper")
            resultLabel.text = "Scissors cut paper. You lose!"
        }
    }

    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
