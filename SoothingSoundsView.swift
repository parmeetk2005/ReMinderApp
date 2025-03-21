//
//  SoothingSoundsView.swift
//  ForSleepDeprivedPeople
//
//  Created by PARMEET KAUR on 10/02/25.
//

import SwiftUI
import AVFoundation

struct SoothingSoundsView: View {
    let sounds = ["Ocean Waves", "Rain", "Birds Chirping", "Early Morning"]
    @State private var selectedSound: String?
    @State private var isSnoozeOn = false
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            List(sounds, id: \ .self) { sound in
                Button(action: {
                    selectedSound = sound
                    playSound(named: sound)
                }) {
                    HStack {
                        Text(sound)
                        Spacer()
                        if selectedSound == sound {
                            Image(systemName: "play.fill")
                        }
                    }
                }
            }
            
            if selectedSound != nil {
                Toggle("Snooze", isOn: $isSnoozeOn)
                    .padding()
            }
        }
        .navigationTitle("Soothing Sounds")
    }
    
    func playSound(named name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}
