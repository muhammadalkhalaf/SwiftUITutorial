//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI
import SwiftData

//@main bir Macro giriş noktasını (Entry Point) belirtmek için kullanılıyor, uygulama buradan başlatılıyor demek
@available(iOS 17, *)
@main
struct SwiftUITutorialApp: App {
    //Uygulama Struct üzerinden gerçekleştirildi çünkü SwiftUI da bütün Viewler Struct
    //Giriş noktasının App protocol e uygun olması ve içeriğini sağlaması lazım
    //App protocol un içinde body diye bir field var, body nin type i scene
    //şu şekilde sağlanacak
    var body: some Scene {
        WindowGroup {
            Birthdays()//Bizim Root View, MainScreen yada HomePage gibi
                .modelContainer(for: Friend.self)
            //modelContainer, Friend verilerinin saklandığı yer ile ekrandaki View arasında bulunan bir çevirmen gibidir.
            //modelContainer, modelin nasıl kaydedileceğini anlamak için Friend sınıfını kullanır.
            // Database <=Container=> View
            //Friend.self belirli bir instance(Object) yerine Friend type ifade eder.
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


let numb = [98, -20, -30, 42, 18, 35]
let asc5 = numb.sorted(by: { (n1:Int, n2:Int) -> Bool in
    return  n1<n2
})
let asc4 = numb.sorted(by: {    n1, n2  -> Bool in
    return  n1<n2
})
let asc3 = numb.sorted(by:{     n1, n2 in
    return  n1<n2
})
let asc2 = numb.sorted(by:{    n1,n2 in
    n1<n2
})
let asc1 = numb.sorted(by:{ $0 < $1 })
let asc = numb.sorted(by: < )
