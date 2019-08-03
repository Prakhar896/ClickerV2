//
//  GameViewController.swift
//  ClickerV2
//
//  Created by ssoeuser on 27/7/19.
//  Copyright © 2019 ssoeuser. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var clickGoalHere : Int = 0
    var timeElapsed : Double = 0.0
    var counter: Int = 0
    var timer: Timer?
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var timeShowLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet var theWholeScreenGestRecog: UITapGestureRecognizer!
    @IBOutlet var startScreenGestRecog: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        theWholeScreenGestRecog.isEnabled = false
        startScreenGestRecog.isEnabled = true
        counterLabel.text = "Tap anywhere to start!"
        timeShowLabel.isHidden = true
        finishButton.isEnabled = false
        finishButton.isHidden = true
    }
    
    @objc func updateCounter() {
        timeElapsed += 0.1
        timeShowLabel.text = "Time: \(timeElapsed.rounded()) seconds"
    }

    fileprivate func startScreenAnimation() {
        counterLabel.font = counterLabel.font.withSize(100)
        counterLabel.text = "3"
        UIView.animate(withDuration: 3.0) {
            
            UIView.animate(withDuration: 3.0) {
                self.view.backgroundColor = .red
            }
            // Scale to 3x its original size
            let scaleTransform = CGAffineTransform(scaleX: 0.33, y: 0.33)
            // Apply the transformation
            self.counterLabel.transform = scaleTransform
        }
        let secondsToDelay = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            self.counterLabel.font = self.counterLabel.font.withSize(100)
            self.counterLabel.text = "2"
            UIView.animate(withDuration: 3.0) {
                UIView.animate(withDuration: 3.0) {
                    self.view.backgroundColor = .yellow
                }
                // Scale to 3x its original size
                let scaleTransform = CGAffineTransform(scaleX: 0.33, y: 0.33)
                // Apply the transformation
                self.counterLabel.transform = scaleTransform
            }
            
        }
        let secondsToDelay2 = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay2) {
            self.counterLabel.font = self.counterLabel.font.withSize(100)
            self.counterLabel.text = "1"
            UIView.animate(withDuration: 3.0) {
                
                UIView.animate(withDuration: 3.0) {
                    self.view.backgroundColor = .green
                }
                // Scale to 3x its original size
                let scaleTransform = CGAffineTransform(scaleX: 0.33, y: 0.33)
                // Apply the transformation
                self.counterLabel.transform = scaleTransform
            }
        }
    }
    
    fileprivate func resetToGameState() {
        startScreenGestRecog.isEnabled = false
        counterLabel.text = "0"
        self.view.backgroundColor = .lightGray
        timeShowLabel.isHidden = false
        theWholeScreenGestRecog.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func startTapped(_ sender: Any) {
        startScreenAnimation()
        let secondsToDelay3 = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay3) {
            self.resetToGameState()
        }
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        timer?.invalidate()
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        if counter != 30 {
            counter += 1
            counterLabel.text = String(counter)
        } else {
            timer?.invalidate()
            timeShowLabel.text = "Game Over!"
            finishButton.isEnabled = true
            finishButton.isHidden = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
