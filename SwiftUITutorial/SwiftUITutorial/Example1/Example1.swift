//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 16.01.2025.
//

import SwiftUI

//Bizim View Struct üzerinden gerçekleştirildi (Bütün view ler Struct)
struct ContentView: View {
    //yaptığımız view view protokolüne uygun olması ve içeriğini sağlaması lazım
    //View protocol un içinde body diye bir field var, body nin type i View
    //şu şekilde sağlanacak (o da computed property)
    var body: some View {
        Text("Hello, World!")//yazı eklemek için Text kullanılıyor
            .fontWeight(.bold)//heavy bold semibold regular ..vs
            .padding(.all, 16)// bottom top leading trailing
            .background(Color.appBackground, in: RoundedRectangle(cornerRadius: 8))
        //appBackground Asset te custom color
        //arka plana hem renk hem de shape verebiliyoruz
            //.cornerRadius(8) //Yuvarlak köşeler yapmak için daha kolay bir yöntem
            .shadow(radius: 5)//isminden anlaşılıyor gölge veriyor
            .font(.headline)//headline sistemde önceden tanımlanmış bir font size ve style.
          //.font(.system(size: 32))// system font ve custom size.
            .foregroundStyle(Color.white)//font color
        
        //default olarak viewleri ortada yerleştiriyor
    }
}

#Preview {//#Preview o da bir macro
    ContentView()// buradaki View Canvas te gösterilecek kaldırsak uygulama çalışıyor sorun olmuyor
}
// Eski Syntax şe şekilde biraz karışıktı
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
