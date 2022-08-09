//
//  Question.swift
//  Quizzler-IOS
//
//  Created by Maricel Sumulong on 8/4/22.
//

import Foundation

struct Question {
    
    let question: String
    let answer: String
    let choices: [String]
    
    init() {
        
        self.question = ""
        self.answer = ""
        self.choices = []
    }
    
    init(question: String, answer: String) {
        
        self.question = question
        self.answer = answer
        self.choices = []
        
    }
    
    init(question: String, choices:[String], answer: String) {
        
        self.question = question
        self.answer = answer
        self.choices = choices
        
    }
    
    func loadQuestions() -> [Question] {
        
        let quiz = [
                Question(question : "Jun Wan and Jeong-Won previously worked at KWMC before becoming exclusive medical staff for VIP wards at Yulje.", answer : "true"),
                Question(question : "Ikjun and Jun Wan were from Busan.", answer : "false"),
                Question(question : "Seok-Hyeong had a crush on Song-Hwa.", answer : "true"),
                Question(question : "Jeong-Won is the middle son of Rosa Jeong.", answer : "false"),
                Question(question : "Ikjun bought a ring for Song-Hwa during her birthday.", answer : "true"),
                Question(question : "Seok-Hyeong's sister committed suicide.", answer : "false"),
                Question(question : "Song-Hwa has three brothers.", answer : "true"),
                Question(question : "The ER doctor's name is Jang Gyeo-Ul.", answer : "false"),
                Question(question : "Actors Yeo Yoon Seok, Kyung Jung-ho and Jung Moon-sung previously worked with Director Shin Won-ho before Hospital Playlist.", answer : "true"),
                Question(question : "Dr. Chu Min-ha works for PICU.", answer : "false")
            ]
        
        return quiz
        
    }
    
}
