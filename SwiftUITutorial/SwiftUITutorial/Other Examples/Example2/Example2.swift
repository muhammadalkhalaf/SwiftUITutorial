//
//  Example2.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 18.12.2024.
//

import SwiftUI

#Preview {
    Example2()
}

struct Example2: View {
    var body: some View {
        
        //VStack(alignment: ,spacing: ,content: <#T##() -> View#>)
        //<#T##() -> View#> buna trailing closure denir son parameter olması lazım
        //VStack(alignment: .leading, spacing: 20,content: {})
        //VStack(alignment: .leading, spacing: 20) {} bu şekilde kısaltıyoruz content yazmadan direk parantez dışarıya alıyoruz
        VStack(alignment: .leading, spacing: 20) {
            //parantezler içinde istediğimiz view leri yazarız vertical şeklinde görünecek
            
            Image(systemName: "globe")// yada Image("Asset ten bir image")
                .resizable()//bunu kullanmazsak orijinal boyutta olacak
            //resizable kullanınca Image bütün boş alanı dolduracak şekilde uzatılacak. o yüzden frame kullandık
                .frame(width: 55, height: 55)//resizable() olmadan frame çalışmıyor
                .foregroundColor(Color.accent)//accent Asset te custom color
                .background(Color(.systemGray4))//color from a UIKit color.(storyboard)
            
            
            StructView()//Custom Subview using struct
            
            functionView()//Custom Subview using function
            
            propertyView//Custom Subview using property
            
            //Subviews kullanarak reusable components yazabiliyoruz
            //böylece daha kısa düzenli kod yazarız
            //Kod ileride daha kolay değiştirebiliriz
            
            ZStack {//view leri birbirinin üstüne yerleştiriyor
                
                RoundedRectangle(cornerRadius: 30, style: .circular)//built-in shape
                    .frame(width: 100, height: 100)
                    .border(.black, width: 2)
                    .background(.blue)
                    .foregroundStyle(.tint)//tint accent ile aynı renk
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.largeTitle)//Font üzerinden imajin boyutu değiştirebiliriz
                    .foregroundStyle(.white)
            }
        }
        .padding()
    }
    
    func functionView() -> some View {
        return Text("function View")
            .padding()
            .background(Color(.systemGray6))//color from a UIKit color.(storyboard)
            .cornerRadius(10)
            .font(.subheadline)
            .foregroundStyle(.secondary)
    }
    
    var propertyView: some View {
        return Text("Property View")
            .border(.red)//padding vermeden önce border
            .padding()
            .border(.black)//padding verdikten sonra border
            //her modifier yeni view veriyor
            //ve bir önceki view i değiştiriyor
    }
}

struct StructView: View {//yada tamamen başka dosyada yazabiliriz.
    var body: some View {
        Text("Struct View")
            .fontWeight(.bold)
            .padding(.all, 16)
            .background(Color.appBackground,
                        in: RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 5)
            .font(.headline)
            .foregroundStyle(Color.white)
    }
}
