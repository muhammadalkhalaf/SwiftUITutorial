//
//  Example3.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 7.01.2025.
//

import SwiftUI

struct Example3: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                DayForecast(day: "Wen", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Thu", isRainy: true, high: 60, low: 40)
                //Kodu tekrarlamamak için sadece bir tane component yazdık subview olarak
                //ve istediğimiz şekilde yeniden kullanabiliriz
            }
        }
    }
}


#Preview {
    Example3()
}

//Custom view with properties
//struct sadece bir view göstermek için değil
//bir de normal struct gibi properties yazıp içinde kullanabiliyoruz
struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)//Font üzerinden imajin boyutu değiştirebiliriz
                //.font(.system(size: 55))//custom size.
                .padding(5)
            
            Text("High: \(high)")
                .fontWeight(.bold)
            
            Text("Low: \(low)")
                .fontWeight(.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

