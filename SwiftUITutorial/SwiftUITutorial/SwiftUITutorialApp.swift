//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

//@main bir Macro giriş noktasını (Entry Point) belirtmek için kullanılıyor, uygulama buradan başlatılıyor demek
@main
struct SwiftUITutorialApp: App {
    //Uygulama Struct üzerinden gerçekleştirildi çünkü SwiftUI da bütün Viewler Struct
    //Giriş noktasının App protocol e uygun olması ve içeriğini sağlaması lazım
    //App protocol un içinde body diye bir field var, body nin type i scene
    //şu şekilde sağlanacak
    var body: some Scene {
        WindowGroup {
            ContentView()//Bizim Root View, MainScreen yada HomePage gibi
        }
    }
    //bu syntax a computed property denir
    //şu syntax a benziyor
    //    func getBody() -> some Scene {
    //        return WindowGroup {
    //            ContentView()
    //        }
    //    }
    //getter gibi yani
    //Scene uygulamanın içeriğini temsil edecek.(Container yani)
    //WindowGroup bir Scene type
    //başka Scene type var (settings scene gibi) ama iOS için sadece WindowGroup kullanılıyor
    //çünkü iOS te sadece bir tane window gösterebiliyor iPadOS ve macOS birden fazla window olabilir
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
