//
//  Example5.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

struct Example5: View {
    //numberOfDice Zarın sayısı
    @State private var numberOfDice: Int = 3
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()//bu satır 3 kez tekrarlayacak
                    //numberOfDice dinamik olarak değişir
                    //.description "1" "2" "3" string şekilde id olarak verilecek
                    // id olmadan ForEach çalışmaz
                }
            }
            
            HStack {
                //butona imaj verebiliriz şu şekilde
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                        //butona her tıklandığında numberOfDice bir azalır
                        //numberOfDice @State olarak işaret ettiğimiz için her değiştiğinde otomatik olarak buradaki view refresh edilecek
                        //ForEach teki DiceView() sayısı değişecek
                    }
                }
                .disabled(numberOfDice == 1)
                //numberOfDice 1 olunca disabled(true) demek buton aktifsiz hale getirilecek
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                        //butona her tıklandığında numberOfDice bir artar
                        //numberOfDice @State olarak işaret ettiğimiz için her değiştiğinde otomatik olarak buradaki view refresh edilecek
                        //ForEach teki DiceView() sayısı değişecek
                    }
                }
                .disabled(numberOfDice == 5)
                //numberOfDice 5 olunca disabled(true) demek buton aktifsiz hale getirilecek

            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.largeTitle)
            //labelStyle ve font HStackin içindeki butonlara uygulanacak
            //dışarından verdik ama içindeki bütün view lere uygulanacak
            //yani her button aynı style i tekrarlamamak için dışarından style verdik
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //frame her iki yönde de gidebildiği kadar genişleyecek.
        // match parent gibi yani
        //frame i kaldırsak wrap content olacak
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    Example5()
}
