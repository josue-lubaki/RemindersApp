//
//  ReminderStatsView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-19.
//

import SwiftUI

struct ReminderStatsView: View {
    
    let icon : String
    let title : String
    let count : Int?
    var iconColor : Color = .blue
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment : .leading, spacing: 10) {
                   Image(systemName: icon)
                        .foregroundColor(iconColor)
                        .font(.title)
                    
                    Text(title)
                        .opacity(0.8)
                }
                Spacer()
                if let count {
                    Text("\(count)")
                        .font(.largeTitle)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray)
        .foregroundColor(.white)
        .clipShape(.rect(cornerRadius: 16, style: .continuous))
    }
}

struct ReminderStatsView_Previews : PreviewProvider {
    static var previews: some View {
        ReminderStatsView(icon: "calendar", title: "Today", count: 9)
    }
}
