//
//  Birthdays.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 15.01.2025.
//

import SwiftUI
import SwiftData

@available(iOS 17, *)
@main
struct BirthdaysSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            Birthdays()
                .modelContainer(for: Friend.self)
            //modelContainer, Friend verilerinin saklandığı yer ile ekrandaki View arasında bulunan bir çevirmen gibidir.
            //modelContainer, modelin nasıl kaydedileceğini anlamak için Friend sınıfını kullanır.
            // Database <=Container=> View
            //Friend.self belirli bir instance(Object) yerine Friend type ifade eder.
        }
    }
}

@available(iOS 17, *)
struct Birthdays: View {
    //@State private var friends: [Friend] = [Friend(name: "Elton Lin", birthday: .now)]
    @Query private var friends: [Friend]// <= Database teki friends ile set ediliyor
    //@Query, database ten kolay ve hızlı bir şekilde veri çekmek için kullanılıyor
    //database teki veriler değiştiğinde View lerin otomatik olarak güncellenmesini sağlar(@State gibi çalışıyor).
    
    //@Query(sort: \Friend.birthday) var friends: [Friend]
    //sort: friends listesi doğum günlerine göre kronolojik olarak sıralanacak.
    //@Query(sort: [SortDescriptor(\Friend.birthday, order: .reverse), SortDescriptor(\Friend.name)]) var friends: [Friend]
    //order: .reverse demek en yeni tarihler en üstte görünür demek (azalan sırada)
    //İkinci Sıralama: Aynı doğum gününe sahip arkadaşlar isimlerine göre A-Z (artan) sıralanır
    
    //@Query(filter: #Predicate<Friend>{$0.name.contains("A")}) var friends: [Friend]
    //Predicate, verilen bir koşula uyan verileri filtrelemek için kullanılıyor.
    //Sadece isminin içinde "A" harfi geçen Friend , friends listesine dahil edilir.

    
    @Environment(\.modelContext) private var modelContext
    //@Environment uygulamanın çevresel durum bilgilerini (environment values) kullanıcının erişimine sunar.
    //Environment values : uygulama genelinde sistem tarafından önceden tanımlanmış değerler veya davranışlardır. (current time zone, locale, colorScheme dark yada light, dismiss gibi burada modelContext kullandık)
    //buradaki backslash (\) a key path denir
    //key path: Bir sınıfın özelliğin değerine doğrudan erişmeden referans veriyor(pointer yani)
    //modelContext: Database daki verilerle etkileşim kurmak için kullanılan bir araçtır. yani verilerin kaydedilmesi, güncellenmesi ve silinmesi işlemleri için kullanılıyor.
    
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(friends) { friend in
                    HStack {
                        if friend.isBirthdayToday {
                            Image(systemName: "birthday.cake")
                        }
                        DatePicker(selection: Binding(get:{friend.birthday},set:{friend.birthday = $0}),
                                   in: Date.distantPast...Date.now,
                                   displayedComponents: .date) {
                            TextField("Add Name",
                                      text:Binding(get:{friend.name},set:{friend.name = $0}))
                            .bold(friend.isBirthdayToday)
                        }
                        
//                        Spacer()
//                        Text(friend.birthday,
//                             format: .dateTime.day().month(.wide).year())
                        
                    }
                }
                .onDelete(perform: deleteFriend)
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate,
                               in: Date.distantPast...Date.now,//user can’t select a date in the future.
                               displayedComponents: .date) {
                        //The closure following DatePicker contains its label. The “New Birthday” title describes what goes into the date picker just fine, so use the label to display the TextField.
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        //View e erişemediğimiz için DatePicker e erişip selected date i okuyamayız
                        //o yüzden @State newDate kullandık (TextField için aynı şey)
                        let newFriend = Friend(name: newName, birthday: newDate)
                        //friends.append(newFriend)
                        modelContext.insert(newFriend)//database e yeni satır eklenecek.
                        //database teki veriler değiştiği için View ler otomatik olarak güncellenip
                        //friends listesine yeni Friend eklenecek.
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)//.bar styles the background in the same style as a system toolbar.
            }
            .task {
                //View görünmeden önce .task içindeki kod çalışacak.(viewWillAppear gibi)
                //                modelContext.insert(Friend(name: "Elton Lin", birthday: .now))
                //                modelContext.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
                //@Query bunları çeker ve friends listesi güncellenir.
            }
        }
    }
    
    func deleteFriend(offsets: IndexSet) {
        modelContext.delete(friends[offsets.first!])
    }
}

@available(iOS 17, *)
#Preview {
    Birthdays()
        .modelContainer(for: Friend.self, inMemory: true)
    //Preview her yenilendiğinde aynı başlangıç ​​durumunda başlamak için .modelContainer kullandık,
    //inMemory modunda, veriler yalnızca uygulama çalıştığı sürece bellekte(RAM da) tutulur ve uygulama kapandığında tamamen silinir.
}
