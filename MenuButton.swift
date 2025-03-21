//
//  MenuButton.swift
//  ForSleepDeprivedPeople
//
//  Created by PARMEET KAUR on 10/02/25.
//

import SwiftUI

struct MenuButton<Destination: View>: View {
    let title: String
    let icon: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .font(.title)
                Text(title)
                    .font(.title2)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 3)
        }
        .padding(.horizontal)
    }
}
