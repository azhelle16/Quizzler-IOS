//
//  QuizBrain.swift
//  Quizzler-IOS
//
//  Created by Maricel Sumulong on 8/5/22.
//

import Foundation
import UIKit

struct QuizBrain {
    
    let quiz = [
            Question(question : "Jun Wan and Jeong-Won previously worked at KWMC before becoming exclusive medical staff for VIP wards at Yulje.", answer : "true"),
            Question(question : "Ikjun and Jun Wan were from Busan.", answer : "false"),
            Question(question : "Seok-Hyeong had a crush on Song-Hwa.", answer : "true"),
            Question(question : "Jeong-Won is the middle son of Rosa Jeong.", answer : "false"),
            Question(question : "Ikjun bought a ring for Song-Hwa for her birthday.", answer : "true"),
            Question(question : "Seok-Hyeong's sister committed suicide.", answer : "false"),
            Question(question : "Song-Hwa has three brothers.", answer : "true"),
            Question(question : "The ER doctor's name is Jang Gyeo-Ul.", answer : "false"),
            Question(question : "Actors Yeo Yoon Seok, Kyung Jung-ho and Jung Moon-sung previously worked with Director Shin Won-ho before Hospital Playlist.", answer : "true"),
            Question(question : "Dr. Chu Min-ha works for PICU.", answer : "false")
        ]
    
    let mcQuiz = [
            Question(question: "What is the name of Ikjun Lee's ex-wife?", choices: ["Yuk Hye-Jeong","Chae Song-Hwa","Kim Tae-Yeon"], answer: "Yuk Hye-Jeong"),
            Question(question: "Where did Seok-Hyeong's mom got the water she threw to her husband's mistress?", choices: ["Bathroom","Cafeteria","Center Garden"], answer: "Bathroom"),
            Question(question: "What was the result of Song-Hwa's mom's neurologist check-up?", choices: ["Parkinson's Disease","Cerebral Aneurysm","Alzheimer's Disease"], answer: "Parkinson's Disease"),
            Question(question: "What is the name of Jeong-Won Ahn's father?", choices: ["Ahn Byeong-U","Ahn Moon-Suk","Ahn Kwang-Hyeon"], answer: "Ahn Byeong-U"),
            Question(question: "How many sibling/s does Jun Wan have?", choices: ["1","2","None"], answer: "1"),
            Question(question: "Which department won the Ping-Pong tournament?", choices: ["Nuclear Medicine","Radiology","HPB"], answer: "Nuclear Medicine"),
            Question(question: "What was the shipping term for couples Seok-Hyeong and Min-ha?", choices: ["Gom-Gom","WinterGarden","IkSong"], answer: "Gom-Gom"),
            Question(question: "Who end up staying at Min-ha's parents' guesthouse?", choices: ["Jun Wan and Seok-Hyeong","Ikjun and Jeong-Won","Song-Hwa"], answer: "Jun Wan and Seok-Hyeong"),
            Question(question: "What was the army rank of Iksun Lee?", choices: ["Major","Captain","Lieutenant"], answer: "Major"),
            Question(question: "Who was the Emergency Medicine Doctor?", choices: ["Bong Kwang-Hyeon","Min Ki-Jun","Cheon Myeong-Tae"], answer: "Bong Kwang-Hyeon")
            
        ]
    
    
    var questionNumber = 0 //needed to track the question to remove to avoid repetition
    var correctAnswers = 0
    var quizCnt = 0 //question being asked
    
    mutating func checkAnswers(u : String, c: String) -> Bool {
        
        if u == c {
            correctAnswers += 1
            return true
        } else {
            return false
          }
        
    }
    
    mutating func getQuestionText(_ rand : Int, _ q : [Question]) -> String {
        
        questionNumber = rand
        return q[rand].question
        
    }
    
    func getProgress() -> Float {
        
        if (quiz.count >= quizCnt) {
            return Float(quizCnt) / Float(quiz.count)
        } else {
            return 0.0
          }
        
    }
    
    mutating func updateQuizCount() {
        
        quizCnt += 1
        
    }
    
    mutating func resetCounters() {
        
        correctAnswers = 0
        quizCnt = 0
        
    }

    func getScore() -> String {
        
        return "SCORE: \(correctAnswers)"
        
    }
    
    func getChoices (_ rand : Int, _ q : [Question]) -> [Int] {
        
        var shuffled_choices : [Int] = []
        while shuffled_choices.count != q[rand].choices.count {
            let rand_choices = Int.random(in: 0..<q[rand].choices.count)
            if !shuffled_choices.contains(rand_choices) {
                //print(rand_choices)
                shuffled_choices.append(rand_choices)
            }
        }
     
        print(shuffled_choices)
        return shuffled_choices
        
    }
    
}
