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
    let value: Int
    var body: some View {
        //MARK: VSTACK
        VStack(alignment: .center) {
            Text(title)
                .font(.caption)
                .padding(.bottom, 10)
            
            Image(systemName: icon)
                .frame(width: 10, height: 10)
                .padding(.bottom, 15)
            
            Text("\(value)\n\(unit)")
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 100) 
    }
}

#Preview {
    DescriptonWeather(title: "Wind",unit: "km/h", icon: "wind", value: 10 )
}
