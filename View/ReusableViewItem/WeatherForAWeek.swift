//
//  WeatherForAWeek.swift
//  WeatherReport
//
//  Created by naswakhansa on 01/10/24.
//


import SwiftUI

struct WeatherForAWeek: View {
    //MARK: PROPERTIES
    let day: String
    let date: String
    
    //MARK: BODY
    var body: some View {
        //MARK: VSTACK
        VStack(alignment: .center) {
            Text(day)
                .font(.headline)
                .padding(.bottom, 5)
            
            Text(date)
                .font(.subheadline)
                .fontWeight(.light)
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(lineWidth: 1)
                .frame(width: 75, height: 75)
        )
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
    }
}

#Preview {
    WeatherForAWeek(day: "Tue", date: "27/09")
}
