//
//  AlertsView.swift
//  ForSleepDeprivedPeople
//
//  Created by PARMEET KAUR on 10/02/25.
//



import SwiftUI

struct AlertsView: View {
    let haptics = ["Accent", "Symphony", "Heartbeat"]
    let tones = ["Chord", "Note", "Cheers", "Classic"]
    let classicTones = ["Aurora", "Bamboo", "Circles", "Ding", "Horn", "Keys", "Swish", "Telegraph", "Tri-Tone"]
    
    @State private var selectedHaptic: String?
    @State private var selectedTone: String?
    
    var body: some View {
        List {
            Section(header: Text("Haptics")) {
                ForEach(haptics, id: \ .self) { haptic in
                    Button(action: { selectedHaptic = haptic }) {
                        HStack {
                            Text(haptic)
                            Spacer()
                            if selectedHaptic == haptic {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            
            Section(header: Text("Alert Tones")) {
                ForEach(tones, id: \ .self) { tone in
                    Button(action: { selectedTone = tone }) {
                        HStack {
                            Text(tone)
                            Spacer()
                            if selectedTone == tone {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            
            if selectedTone == "Classic" {
                Section(header: Text("Classic Tones")) {
                    ForEach(classicTones, id: \ .self) { tone in
                        Button(action: { selectedTone = tone }) {
                            HStack {
                                Text(tone)
                                Spacer()
                                if selectedTone == tone {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Alerts")
    }
}
