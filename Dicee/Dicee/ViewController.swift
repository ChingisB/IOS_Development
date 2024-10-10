//
//  ViewController.swift
//  Dicee
//
//  Created by Чингис Богдатов on 10.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // Way to properly store names of image files
    let diceImages: [String] = [
        "dice-six-faces-one",
        "dice-six-faces-two",
        "dice-six-faces-three",
        "dice-six-faces-four",
        "dice-six-faces-five",
        "dice-six-faces-six"
    ]
    
    // references to out UIViews
    @IBOutlet weak var diceImageVIew1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var shakeButton: UIButton!
    
    // I googled it. As far as I understand It's a flag that a viewController can be the first responder to a gesture or a motion
    override var canBecomeFirstResponder: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // So now it tells that it's ready to check the events
        self.becomeFirstResponder()
        
        shakeButton.addTarget(self, action: #selector(onShakeButtonPress), for: .touchUpInside)
        
    }
    
    // Function that is executed when button is pressed
    @objc private func onShakeButtonPress(_ sender: AnyObject?){
        shakeDice()
    }
    
    // Dice shake logic. Pretty straightforward
    private func shakeDice(){
        let dice1NewIndex = Int.random(in: 0..<diceImages.count)
        var dice2NewIndex = Int.random(in: 0..<diceImages.count)
        
        while(dice1NewIndex == dice2NewIndex){
            dice2NewIndex = Int.random(in: 0..<diceImages.count)
        }
        
        diceImageVIew1.image = UIImage(named: diceImages[dice1NewIndex])
        diceImageView2.image = UIImage(named: diceImages[dice2NewIndex])
    }
    
    // Overriden method that checks what kind of event our ViewController is checking
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            shakeDice()
        }
    }
    
    // Probably it just a safe way to dereference so the system wouldn't call our viewController after it dissappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.resignFirstResponder()
    }

}

