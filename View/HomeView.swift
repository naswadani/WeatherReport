//
//  HomeView.swift
//  WeatherReport
//
//  Created by naswakhansa on 01/10/24.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Spacer()
                Text("Today")
                    .font(.system(.title))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Text("Friday, 27 Sep")
                    .font(.system(.headline))
                    .foregroundColor(.black)
                    .fontWeight(.light)
                VStack(alignment: .center) {
                    Image(systemName: "cloud.rain")
                        .resizable()
                        .frame(width: 20, height: 25)
                        .padding(.top, 10)
                    Text("Heavy Rain")
                        .font(.system(.title2))
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                    Text("20°")
                        .font(.system(.largeTitle))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer()
                    HStack {
                        DescriptonWeather(title: "Wind", unit: "km/h", icon: "wind", value: 10)
                        DescriptonWeather(title: "Precipitation", unit: "mm", icon: "drop.degreesign", value: 9)
                        DescriptonWeather(title: "Pressure", unit: "hpa", icon: "arrow.down.and.line.horizontal.and.arrow.up", value: 100)
                        DescriptonWeather(title: "Air Quality", unit: "point", icon: "water.waves", value: 140)
                    }
                    .padding(.bottom, 10)
                    
                }
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.black)
                        .frame(width: 350, height: 255)
                )
                
                Text("This Week")
                    .font(.system(.title2))
                    .padding(.top, 35)
                HStack {
                    WeatherForAWeek(day: "Tue", date: "27/09")
                    WeatherForAWeek(day: "Wed", date: "28/09")
                    WeatherForAWeek(day: "Thu", date: "29/09")
                    WeatherForAWeek(day: "Fri", date: "30/09")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
