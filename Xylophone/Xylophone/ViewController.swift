//
//  ViewController.swift
//  Xylophone
//
//  Created by Чингис Богдатов on 13.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // define player
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // this is the onClick function for all of the buttons
    // it takes the label of the button and call playSound method with it
    @IBAction func onButtonClick(_ sender: UIButton){
        playSound(note: sender.titleLabel?.text ?? "A")
    }
    
    // Bundle.main.url probably is responsible for creating a link to project specific resources
    func playSound(note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }

        do {

            // Probably a singleton responsible for app sound session
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)


            // I guess it's impossible to create it as a let variabl
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print(error.localizedDescription)
        }
    }



}

