//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Zach Wilner on 9/3/17.
//  Copyright © 2017 Wilner. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // MARK: - Properties
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 4

    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    //This code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - My Own Functions
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName){
            //check if data is a sound file
            do{
                
                try audioPlayer = AVAudioPlayer(data: sound.data)
                
                audioPlayer.play()
            }catch{
                print("ERROR: data in \(soundName) couldn't be played as a sound")
            }
            
            
        } else{
            //if reading the asset didnt work tell the user report error.
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    
    
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    // MARK: - Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn &&  soundNumber != -1{
            //stop playing
            awesomePlayer.stop()
            
        }
        
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
       let messages = ["You are Fantastic!",
                       "You Are Great!",
                       "You Are Amazing!",
                       "When the Genius Bar needs help, they call you!",
                       "You Brighten My Day!",
                       "I can't wait to use your app!",
                       "Fabulous? That's You!"]
        
        //show message
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
       
        //show an image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        
        
        if soundSwitch.isOn{
            //get random number for sound name
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            
            
            //play a sound
            
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
    }
    
}

