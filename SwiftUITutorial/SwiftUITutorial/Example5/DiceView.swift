//
//  DiceView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

//Dice zar demek
struct DiceView: View {
    //numberOfPips zarın üstündeki noktaların sayısı demek
    @State private var numberOfPips: Int = 1
    //@State e property wrapper denir.
    //@State bu değişkenin SwiftUI tarafından izlenmesini sağlar. Bu sayede değişkende bir değişiklik olduğunda, SwiftUI bu değişikliği algılar ve otomatik olarak buradaki view yeniden oluşturur (re-render) refresh.
    //state is owned by the view. You always mark state properties private so other views can’t interfere with their value.
    //hep private olacak çünkü yalnızca buradaki view tarafından kontrol edilir dışarıdan kontrol edilmez.
    //@State sadece value type için kullanılır structs, Int .. vb
    //reference type için @StateObject kullanılıyor ve o class @observale olması lazım
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)

            //Button(title, action: <#T##() -> Void#>)
            //<#T##() -> Void#> trailing closure son parameter oluyor
            //Button(title, action: {})
            //Button(title) {}
            //bu şekilde kısaltıyoruz action yazmadan direk parantez dışarıya alıyoruz
            //button a tıklanınca parantez içindeki işlem çalışacak
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                    //1 ile 6 aralığında rastgele bir değer döndürür.
                    //numberOfPips değiştiğinde otomatik olarak buradaki view refresh edilecek
                }
            }
            .buttonStyle(.bordered)
            
        }
    }
}

#Preview {
    DiceView()
}
