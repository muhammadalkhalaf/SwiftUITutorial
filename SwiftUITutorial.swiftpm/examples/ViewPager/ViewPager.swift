//
//  ViewPager.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 7.01.2025.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]


struct ViewPager: View {
    
    private func MyTabView() -> some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .tabViewStyle(.page)
        .foregroundStyle(.white)
        //When you apply .foregroundStyle to a view, the color will cascade down to all subviews that don’t set their own foreground style.
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            MyTabView()
                .background(Gradient(colors: gradientColors))
        } else {
            MyTabView()
                .background(.brown)
        }
    }
}


#Preview {
    ViewPager()
}

extension Color {
    static let gradientTop = Color("GradientTop")
    static let gradientBottom = Color("GradientBottom")
}
