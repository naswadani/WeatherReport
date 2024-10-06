//
//  PickCityView.swift
//  WeatherReport
//
//  Created by naswakhansa on 04/10/24.
//

import SwiftUI

struct PickCityView: View {
    //MARK: PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ViewModel 
    
    var body: some View {
        //MARK: NAVIGATION VIEW
        NavigationView {
            //MARK: VSTACK
            VStack {
                //MARK: HSTACK
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .opacity(0.5)
                    TextField("Search City", text: $viewModel.searchCity)
                        .font(.system(size: 19, weight: .medium))
                }
                .padding(.all, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.gray.opacity(0.15))
                        .frame(height: 40)
                )
                
                ForEach(viewModel.filteredCities, id: \.name) { city in
                    ItemListCity(location: city)
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.fetchWeatherReport(lon: city.lon, lat: city.lat)
                            viewModel.fetchForecastWeather(lon: city.lon, lat: city.lat)
                            presentationMode.wrappedValue.dismiss()
                        }
                    Divider()
                        .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("City", displayMode: .inline)
            .navigationBarBackButtonHidden()
            .navigationBarItems(trailing:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
            )
            .onChange(of: viewModel.searchCity) {
                viewModel.searchLocationCity()
            }
        }
    }
}

#Preview {
    PickCityView(viewModel: ViewModel())
}
