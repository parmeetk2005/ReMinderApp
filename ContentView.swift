import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("ReMinder")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                MenuButton(title: "Alerts", icon: "bell", destination: AlertsView())
                MenuButton(title: "Alarms", icon: "alarm", destination: AlarmsView())
                MenuButton(title: "Soothing Sounds", icon: "music.note", destination: SoothingSoundsView())

                Spacer()
            }
            .padding()
        }
    }
}

