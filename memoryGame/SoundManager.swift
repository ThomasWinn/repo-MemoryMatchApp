//
//  SoundManager.swift
//  memoryGame
//
//  Created by Thomas Nguyen on 8/26/18.
//  Copyright © 2018 Thomas Nguyen. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
   static func playSound(_ effect:SoundEffect) {
        
        var soundFileName = ""
        
        
        //Choose what file name to play
        switch effect {
            
        case .flip:
            soundFileName = "cardflip"
        
        case .shuffle:
            soundFileName = "shuffle"
        
        case .match:
            soundFileName = "dingcorrect"
            
        case .nomatch:
            soundFileName = "dingwrong"
        }
        
        //Get the path to the sound file in the bundle
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find source file \(soundFileName) in bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            //Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound 
            audioPlayer?.play()
        }
        catch {
            //Couldn't create audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFileName)")
        }
        
    }
}

