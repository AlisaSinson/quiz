//
//  ViewController.swift
//  Quizzer
//
//  Created by Алиса on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    
   var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
       
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //true,false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        sender.layer.cornerRadius = 20
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .systemRed
        }
        
        quizBrain.nextQuestion()
        updateUI()
        
    }
    
    func updateUI() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            self.questionLabel.text = self.quizBrain.getQuestionText()
            self.progressBar.progress = self.quizBrain.getProgress()
            scoreLabel.text = "Score:\(self.quizBrain.getScore())"
            self.trueButton.backgroundColor = .clear
            self.falseButton.backgroundColor = .clear
            
        }
    }
    
}
