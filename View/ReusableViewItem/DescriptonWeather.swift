//
//  DescriptonWeather.swift
//  WeatherReport
//
//  Created by naswakhansa on 01/10/24.
//


import SwiftUI

struct DescriptonWeather: View {
    //MARK: PROPERTIES
    let title: String
    let unit: String
    let icon: String
    let value: String
    var body: some View {
        //MARK: VSTACK
        VStack(alignment: .center) {
            Text(title)
                .font(.subheadline)
                .padding(.bottom, 10)
            
            Image(systemName: icon)
                .frame(width: 15, height: 15)
                .padding(.bottom, 10)
            
            Text("\(value)\n\(unit)")
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100) 
    }
}

#Preview {
    DescriptonWeather(title: "Wind",unit: "km/h", icon: "wind", value: "10" )
}
