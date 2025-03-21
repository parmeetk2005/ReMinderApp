//
//  AlarmsView.swift
//  ForSleepDeprivedPeople
//
//  Created by PARMEET KAUR on 10/02/25.
//

import SwiftUI

struct AlarmsView: View {
    @State private var alarms: [Alarm] = []
    @State private var showAddAlarmSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach($alarms) { $alarm in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(alarm.time)
                                .font(.title2)
                                .bold()
                            Text(alarm.label)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Toggle("", isOn: $alarm.isOn)
                            .labelsHidden()
                    }
                    .padding(.vertical, 8)
                }
                .onDelete { indexSet in
                    alarms.remove(atOffsets: indexSet)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .frame(maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Alarms")
                        .font(.title)
                        .bold()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .overlay(
            Button(action: { showAddAlarmSheet = true }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                    .shadow(radius: 4)
            }
            .padding(),
            alignment: .bottomTrailing
        )
        .sheet(isPresented: $showAddAlarmSheet) {
            AddAlarmView { newAlarm in
                alarms.append(newAlarm)
                showAddAlarmSheet = false
            }
        }
    }
}
