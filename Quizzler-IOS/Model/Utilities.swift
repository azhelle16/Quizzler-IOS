//
//  Utilities.swift
//  Quizzler-IOS
//
//  Created by Maricel Sumulong on 8/6/22.
//

import Foundation
import UIKit

struct ButtonDesigns {
    
    let Blue = UIColor.init(red: 0/255, green: 123/255, blue: 241/255, alpha: 1.0)
    let Orange = UIColor.init(red: 251/255, green: 67/255, blue: 30/255, alpha: 1.0)
    
    func styleFilledButton(_ button:UIButton) {
        
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        // Filled rounded corner style
        button.backgroundColor = Blue//.withAlphaComponent(0.7)
        
        // add rounded edges
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black//UIColor.white
        
    }
    
    // Orange hollow button with border and Orange label
    func styleHollowButton(_ button:UIButton) {
        
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = Orange.cgColor
        button.backgroundColor = UIColor.black
        
        // add rounded edges
        button.layer.cornerRadius = 25.0
        //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = Orange//UIColor.white
        
    }
    
}

struct storyBoards {
    
    func getStoryBoard(_ option : String) -> UIViewController {
        
        var id : String
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let hvc :UIViewController
        
        switch (option.lowercased()) {
            
            case "multiple choice":
                id = "MCViewController"
                hvc = sb.instantiateViewController(withIdentifier: id) as! MultipleChoiceViewController
            default:
                id = "TFViewController"
                hvc = sb.instantiateViewController(withIdentifier: id) as! ViewController
            
        }
        
        return hvc
        
    }
    
}

struct GamePlay {
    
    func endGame(_ from : String) {
        
        //let sb = UIStoryboard(name: "Main", bundle: nil)
        
        switch (from.lowercased()) {
            
            case "tf":
                print("TRUE OR FALSE")
                var qB = QuizBrain()
                qB.resetCounters()
            default:
                print("MULTIPLE CHOICE")
            
        }
        
//        let hvc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//
//        return hvc
        
    }
    
    func goBack() -> UIViewController {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        var qB = QuizBrain()
        qB.resetCounters()
        
        let hvc = sb.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        return hvc
        
    }
    
}
