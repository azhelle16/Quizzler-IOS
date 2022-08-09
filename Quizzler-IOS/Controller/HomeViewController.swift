//
//  HomeViewController.swift
//  Quizzler-IOS
//
//  Created by Maricel Sumulong on 8/6/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var mcButton: UIButton!
    @IBOutlet weak var tfButton: UIButton!
    
    var gameButtons = ButtonDesigns()
    var sboard = storyBoards()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        gameButtons.styleHollowButton(mcButton)
        gameButtons.styleHollowButton(tfButton)
        
    }
    
    @IBAction func gameSelected(_ sender: UIButton) {
        
        //let hvc = storyboard?.instantiateViewController(withIdentifier: sboard.getStoryBoard(sender.currentTitle!)) as! ViewController
        present(sboard.getStoryBoard(sender.currentTitle!), animated: true, completion: nil)
        
    }
    
}
