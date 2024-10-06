//
//  HomeView.swift
//  WeatherReport
//
//  Created by naswakhansa on 01/10/24.
//


import SwiftUI

struct HomeView: View {
    // MARK: PROPERTIES
    @StateObject var viewModel: ViewModel = ViewModel()
    @State private var rotate = false
    @State private var isSheetPresented = false

    var body: some View {
        // MARK: VSTACK
        VStack {
            Text("Today")
                .font(.system(.title))
                .fontWeight(.bold)
            
            Text("\(viewModel.currentWeather?.date ?? "" ) ")
                .font(.system(.headline))
                .fontWeight(.light)
            
            //MARK: VSTACK
            VStack(alignment: .center) {
                Image(systemName: WeatherIcon(weatherID: viewModel.currentWeather?.weather.first?.id ?? 800).rawValue)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.top, 10)
                
                Text("\(viewModel.currentWeather?.weather.first?.main ?? "")")
                    .font(.system(.title2))
                    .fontWeight(.medium)
                
                Text("\(viewModel.currentWeather?.main.temperature ?? 0)°")
                    .font(.system(.largeTitle))
                    .fontWeight(.bold)
                //MARK: HSTACK
                HStack {
                    DescriptonWeather(title: "Wind", unit: "km/h", icon: "wind", value: viewModel.currentWeather?.wind.speedString ?? "" )
                    DescriptonWeather(title: "Precipitation", unit: "mm", icon: "drop.degreesign", value: "\(viewModel.currentWeather?.main.humidity ?? 0)")
                    DescriptonWeather(title: "Pressure", unit: "hpa", icon: "arrow.down.and.line.horizontal.and.arrow.up", value: "\(viewModel.currentWeather?.main.humidity ?? 0)")
                }
                .padding(.bottom, 10)
                
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(lineWidth: 2)
                    .frame(width: 350, height: 255)
            )
            
            Text("This Week")
                .font(.system(.title2))
                .padding(.top, 35)
            
            // MARK: HSTACK
            HStack {
                WeatherForAWeek(day: "Tue", date: "27/09")
                WeatherForAWeek(day: "Wed", date: "28/09")
                WeatherForAWeek(day: "Thu", date: "29/09")
                WeatherForAWeek(day: "Fri", date: "30/09")
            }
            Spacer()
            
            // MARK: VSTACK
            VStack {
                Image(systemName: rotate ? "chevron.down" : "chevron.up")
                    .font(.system(.title3))
                Text(viewModel.currentWeather?.name ?? "Unknown City")       .font(.system(.title3))
                    .padding(.top, 10)
            }
            .onTapGesture(perform: {
                self.isSheetPresented = true
            })
            .sheet(isPresented: $isSheetPresented) {
                PickCityView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    HomeView()
}
