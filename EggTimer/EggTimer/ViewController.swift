//
//  ViewController.swift
//  EggTimer
//
//  Created by Чингис Богдатов on 14.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    var timer: Timer?
    var totalTime: Int = 0
    var secondsPassed: Int = 0

    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
    }
    
    private func setupTimer(durationInMinutes: Int){
        timer?.invalidate()
        secondsPassed = 0
        totalTime = durationInMinutes * 60
        progressBar.progress = 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func onEggButtonClick(_ sender: UIButton) {
        let timerCount = sender.tag
        setupTimer(durationInMinutes: timerCount)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            let progress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = progress
        } else {
            timer?.invalidate()
            playSound()
        }
    }
    
    private func playSound(){
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        do {
            // Probably a singleton responsible for app sound session
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }


}

