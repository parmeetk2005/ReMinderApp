//
//  AddAlarmView.swift
//  ForSleepDeprivedPeople
//
//  Created by PARMEET KAUR on 10/02/25.
//

import SwiftUI

struct AddAlarmView: View {
    @State private var alarmLabel: String = "Alarm"
    @State private var selectedTime = Date()
    @State private var repeatOption = "Never"
    @State private var snoozeOn = true
    @State private var selectedSound = "Reflection"
    
    let repeatOptions = ["Never", "Every Day", "Weekdays", "Weekends", "Custom"]
    let sounds = ["Breaking", "Journey", "Reflection", "Seedling", "Storytime", "None"]
    
    var onSave: (Alarm) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Label")) {
                    TextField("Alarm Name", text: $alarmLabel)
                }
                
                Section(header: Text("Time")) {
                    DatePicker("Select Time", selection: $selectedTime, displayedComponents: [.hourAndMinute])
                        .datePickerStyle(WheelDatePickerStyle())
                }
                
                Section(header: Text("Repeat")) {
                    Picker("Repeat", selection: $repeatOption) {
                        ForEach(repeatOptions, id: \ .self) { Text($0) }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Sound")) {
                    Picker("Sound", selection: $selectedSound) {
                        ForEach(sounds, id: \ .self) { Text($0) }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section {
                    Toggle("Snooze", isOn: $snoozeOn)
                }
            }
            .navigationTitle("Add Alarm")
            .navigationBarItems(trailing: Button("Save") {
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                let formattedTime = formatter.string(from: selectedTime)
                onSave(Alarm(time: formattedTime, label: alarmLabel, isOn: true))
            })
        }
    }
}

struct Alarm: Identifiable {
    let id = UUID()
    var time: String
    var label: String
    var isOn: Bool
}
