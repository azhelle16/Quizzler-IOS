//
//  MultipleChoiceViewController.swift
//  Quizzler-IOS
//
//  Created by Maricel Sumulong on 8/8/22.
//

import UIKit

class MultipleChoiceViewController: UIViewController {
    
    @IBOutlet weak var mcGoBack: UIButton!
    @IBOutlet weak var qBground: UIImageView!
    @IBOutlet weak var mcQLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var mcProgressBar: UIProgressView!
    @IBOutlet weak var mcStartButton: UIButton!
    @IBOutlet weak var mcScoreLabel: UILabel!
    @IBOutlet weak var mcEndGame: UIButton!
    @IBOutlet weak var mcStartView: UIView!
    
    var quizBrain = QuizBrain()
    var quiz : [Question] = []
    var setupButtons = ButtonDesigns()
    var gb = GamePlay()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupButtonsForGamePlay()
        showHideElements(false,true)
        quiz = quizBrain.mcQuiz
        
    }
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        
        //CHECKS IF THERE IS ONGOING QUIZ
        if (quizBrain.quizCnt > 0) {
            
            let dialogMessage = UIAlertController(title: "Notification", message: "Are you sure you want to end the game?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
                //PresenterManager.shared.show(vc: .userHome)
                self.present(self.gb.goBack(), animated: true, completion: nil)
        
            })
            let no = UIAlertAction(title: "No", style: .default, handler: { (action) -> Void in
                
            })
            dialogMessage.addAction(yes)
            dialogMessage.addAction(no)
            present(dialogMessage, animated: true, completion: nil)
            
        } else {
            
            present(gb.goBack(), animated: true, completion: nil)
            
          }
        
    }
    
    @IBAction func choicesButtonsPressed(_ sender: UIButton) {
        
        // CHECKS ANSWERS
        let userAnswer = sender.currentTitle!.lowercased()
        let correct = quiz[quizBrain.questionNumber].answer.lowercased()
        
        if quizBrain.checkAnswers(u : userAnswer, c : correct) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
          }
        
        sender.setTitleColor(.black, for: .normal)
        
        // HOW MANY QUESTIONS HAVE ALREADY BEEN ASKED
        quizBrain.updateQuizCount()
        
        // UPDATES PROGRESS BAR
        mcProgressBar.progress = quizBrain.getProgress()
        
        // TO AVOID QUESTION TO BE REPEATED
        quiz.remove(at: quizBrain.questionNumber)
        
        // UPDATE SCORE
        mcScoreLabel.text = quizBrain.getScore()
        
        // CHECKS IF CURRENT QUIZ IS ALREADY DONE
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            sender.setTitleColor(.white, for: .normal)
            self.setupButtonsForGamePlay()
            
            if self.quiz.count == 0 {
                
                self.showHideElements(false,true)
                self.quizBrain.resetCounters()
                self.mcProgressBar.progress = self.quizBrain.getProgress()
                self.mcEndGame.isHidden = true
                
            } else {
                
                self.showQuestion()
              
              }
            
          }
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
    
        mcScoreLabel.text = quizBrain.getScore()
        showQuestion()
        showHideElements(true, false)
        
    }

    @IBAction func endGameButton(_ sender: UIButton) {
        
        // CHECKS IF THERE IS ONGOING QUIZ
        if (quizBrain.quizCnt > 0) {
            
            let dialogMessage = UIAlertController(title: "Notification", message: "Are you sure you want to end the game?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
                self.showHideElements(false,true)
                self.quizBrain.resetCounters()
                self.mcProgressBar.progress = self.quizBrain.getProgress()
                self.quiz = self.quizBrain.mcQuiz
            })
            let no = UIAlertAction(title: "No", style: .default, handler: { (action) -> Void in
                
            })
            dialogMessage.addAction(yes)
            dialogMessage.addAction(no)
            present(dialogMessage, animated: true, completion: nil)
            
        } else {
            
            present(gb.goBack(), animated: true, completion: nil)
            
          }
        
    }
    
    func setupButtonsForGamePlay() {
        
        setupButtons.styleHollowButton(choice1Button)
        setupButtons.styleHollowButton(choice2Button)
        setupButtons.styleHollowButton(choice3Button)
        setupButtons.styleFilledButton(mcStartButton)
        setupButtons.styleFilledButton(mcEndGame)
        setupButtons.styleFilledButton(mcGoBack)
        
    }
    
    func showHideElements(_ flag1 : Bool, _ flag2 : Bool) {
        
        mcStartView.isHidden = flag1
        mcQLabel.isHidden = flag2
        choice1Button.isHidden = flag2
        choice2Button.isHidden = flag2
        choice3Button.isHidden = flag2
        mcProgressBar.isHidden = flag2
        qBground.isHidden = flag2
        //scoreView.isHidden = flag1
        mcEndGame.isHidden = flag2
        
    }

    func showQuestion() {
        
        // TO FILL UP QUESTION ARRAY
        if (quiz.count == 0) {
            quiz = quizBrain.mcQuiz
        }
        
        // RANDOMLY SELECTS QUESTIONS
        let rand = Int.random(in: 0...quiz.count - 1)
        mcQLabel.text = quizBrain.getQuestionText(rand,quiz)
        let choices = quizBrain.getChoices(rand,quiz)
        choice1Button.setTitle(quiz[rand].choices[choices[0]], for: .normal)
        choice2Button.setTitle(quiz[rand].choices[choices[1]], for: .normal)
        choice3Button.setTitle(quiz[rand].choices[choices[2]], for: .normal)
        
    }

}
