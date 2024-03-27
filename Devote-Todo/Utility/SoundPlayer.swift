//
//  SoundPlayer.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-26.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Error in plaing soound")
        }
    }
}
