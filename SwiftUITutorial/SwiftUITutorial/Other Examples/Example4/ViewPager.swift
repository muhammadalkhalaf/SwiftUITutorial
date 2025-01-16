//
//  ViewPager.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 7.01.2025.
//

import SwiftUI

struct ViewPager: View {
    
    private func MyTabView() -> some View {
        TabView {
            WelcomePage()
            FeaturesPage()
        }
        .tabViewStyle(.page)
        .foregroundStyle(.white)
        //When you apply .foregroundStyle to a view, the color will cascade down to all subviews that don’t set their own foreground style.
        //dışarından verdik ama içindeki bütün subview lere bu foregroundStyle uygulanacak
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


let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]
