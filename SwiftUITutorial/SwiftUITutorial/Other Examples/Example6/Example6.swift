//
//  Example6.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 8.01.2025.
//

import SwiftUI

struct Example6: View {
    @State private var names: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun",]
    //Swift te listeler value type olduğu için @State kullanabiliriz
    //Bir value type başka bir değişkene atandığında, tamamen bağımsız bir kopya oluşturulur
    //Bir reference type başka bir değişkene atandığında, aynı bellekteki adrese işaret eder.
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                //hierarchical modu ikonun her layer ine farklı alpha seviyesi uygulanır
                //ama o ikon multi layer olması lazım
                //pencil ikonu deneyelim
                
                Text("Pick-a-Pal")
            }
            //.bold() iOS 16
            //.fontWeight(.bold) iOS 16
            .font(.title.bold())
            //.font(.title.weight(.bold))
            //.font(.system(size: 30, weight: .bold))
            
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2.bold())
                .foregroundStyle(.tint)
            
            List {
                //UITableView e benzer ama burada delegate e gerek yok
                //Liste de varsayılan tasarım stili uygular (örneğin, satırlar arası çizgiler) ve swipeActions header footer multi sections onDelete onMove gibi özellikleri var ileride bakacağız
                //ScrollView de hiç bir tasarım stili uygulamaz ve swipeActions ve diğer özellikler yok
                ForEach(names, id: \.description) { name in
                    Text(name)
                }
            }
            //otomatik olarak List bütün boş alanı dolduracak şekilde uzatılacak
            //yani List her iki yönde gidebildiği kadar genişleyecek.
            
            //.listStyle(.plain)
            .cornerRadius(15)
            //.clipShape(.rect(cornerRadius: 15))
            //.clipShape(RoundedRectangle(cornerRadius: 15))
            
            //Text yazmak için TextField kullanılır
            //şuradaki "Add Name" placeholder oluyor
            TextField("Add Name", text: $nameToAdd)//$ işareti Binding demek
            //Binding, bir değişkeni iki yönlü bağlamaya olanak tanır, yani bir değeri başka bir yerden okuma ve aynı zamanda o değeri değiştirme yeteneği sağlar.
            //burada TextField nameToAdd değerini okuyor ve yazdığımızda bu yazıyı nameToAdd değişkenine atanıyor
                .padding(.bottom, 10)
                .autocorrectionDisabled()
            //isimler yazdığımız için auto correction iptal edebiliriz
                .onSubmit {
                    // Enter yada Return yada Geç butona tıklayınca buradaki submit işlemi çalışacak
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        //names listesi @State olarak işaret ettiğimiz için her yeni isim eklendiğinde otomatik olarak buradaki List View refresh edilecek
                        nameToAdd = ""
                    }
                }
            
            Divider()
            //ayırmak için default separator bir view ekler.
            //yerine Rectangle().fill(color).frame(height) kullanabilirdik
            
            //Switch button eklemek için Toggle kullanırız
            Toggle("Remove when picked",systemImage: "trash.slash",
                   isOn: $shouldRemovePickedName)//$ işareti Binding demek
            //burada Toggle shouldRemovePickedName değerini okuyor ve değiştirdiğimizde yeni değeri shouldRemovePickedName değişkenine atanıyor

            Button {
                if let randomName = names.randomElement() {
//                    listeden rastgele bir isim döndürür.
                    pickedName = randomName
                    if shouldRemovePickedName {
                        names.removeAll { $0 == randomName }
//                      seçiliği isim listeden siliniyor
                    }
                } else {
                    pickedName = ""
                }
            } label: { // button a custom label verebiliyoruz
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    //.frame(maxWidth: .infinity)//width match parent olacak
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    Example6()
}
