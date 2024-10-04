//
//  ItemListCity.swift
//  WeatherReport
//
//  Created by naswakhansa on 04/10/24.
//

import SwiftUI

struct ItemListCity: View {
    //MARK: PROPERTIES
    let location: LocationModel
    var body: some View {
        //MARK: HSTACK
        HStack{
            //MARK: VSTACK
            VStack(alignment: .leading) {
                Text("\(location.name), \(location.country)")
                    .font(.system(.headline))
                HStack(spacing: 15) {
                    Text("\(location.latitude)")
                        .font(.system(.caption))
                    Text("\(location.longitude)")
                        .font(.system(.caption))
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ItemListCity(location: LocationModel(name: "London", lat: 51.5073219, lon: 0.1276474, country: "GB"))
}
