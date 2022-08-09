//
//  ViewController.swift
//  Quizzler-IOS
//
//  Created by Maricel Sumulong on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var answerView: UIView!
    @IBOutlet weak var extraView: UIView!
    @IBOutlet weak var questionBground: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var endGame: UIButton!
    @IBOutlet weak var goBack: UIButton!
    
    var quizBrain = QuizBrain()
    var quiz : [Question] = []
    var setupButtons = ButtonDesigns()
    var gb = GamePlay()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupButtonsForGamePlay()
        showHideElements(false,true)
        quiz = quizBrain.quiz
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        showHideElements(true,false)
        showQuestion()
        scoreLabel.text = quizBrain.getScore()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
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
        progressBar.progress = quizBrain.getProgress()
        
        // TO AVOID QUESTION TO BE REPEATED
        quiz.remove(at: quizBrain.questionNumber)
        
        // UPDATE SCORE
        scoreLabel.text = quizBrain.getScore()
        
        // CHECKS IF CURRENT QUIZ IS ALREADY DONE
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
            sender.setTitleColor(.white, for: .normal)
            self.setupButtonsForGamePlay()
            
            if self.quiz.count == 0 {
                
                self.showHideElements(false,true)
                self.quizBrain.resetCounters()
                self.progressBar.progress = self.quizBrain.getProgress()
                self.endGame.isHidden = true
                
            } else {
                
                self.showQuestion()
              
              }
            
          }
        
    }

    @IBAction func endGameButtonPressed(_ sender: UIButton) {
        
        if (quizBrain.quizCnt > 0) {
            
            let dialogMessage = UIAlertController(title: "Notification", message: "Are you sure you want to end the game?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
                self.showHideElements(false,true)
                self.quizBrain.resetCounters()
                self.progressBar.progress = self.quizBrain.getProgress()
                self.quiz = self.quizBrain.quiz
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
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        
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
    
    func showQuestion() {
        
        // TO FILL UP QUESTION ARRAY
        if (quiz.count == 0) {
            quiz = quizBrain.quiz
        }
        
        // RANDOMLY SELECTS QUESTIONS
        qLabel.text = quizBrain.getQuestionText(Int.random(in: 0...quiz.count - 1),quiz)
        
    }
    
    func setupButtonsForGamePlay() {
        
        setupButtons.styleHollowButton(trueButton)
        setupButtons.styleHollowButton(falseButton)
        setupButtons.styleFilledButton(startButton)
        setupButtons.styleFilledButton(endGame)
        setupButtons.styleFilledButton(goBack)
        
    }
    
    func showHideElements(_ flag1 : Bool, _ flag2 : Bool) {
        
        startView.isHidden = flag1
        qLabel.isHidden = flag2
        trueButton.isHidden = flag2
        falseButton.isHidden = flag2
        progressBar.isHidden = flag2
        questionBground.isHidden = flag2
        //scoreView.isHidden = flag1
        endGame.isHidden = flag2
        
    }
    
}

