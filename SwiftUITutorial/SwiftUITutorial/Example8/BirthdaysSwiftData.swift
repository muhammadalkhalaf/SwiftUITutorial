//
//  BirthdaysSwiftData.swift
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
            BirthdaysSwiftData()//Bizim Root View
                .modelContainer(for: Friend.self)
            //modelContainer, Friend verilerinin saklandığı yer ile ekrandaki View arasında bulunan bir çevirmen gibidir.
            //modelContainer, modelin nasıl kaydedileceğini anlamak için Friend sınıfını kullanır.
            // Database <=Container=> View
            //Friend.self belirli bir instance(Object) yerine Friend type ifade eder.
            //Bu şekilde SwiftData database de tek bir table olduğunu anlayacak o da Friend.
            //modelContainer database e erişmek için bizim root view e bir yol sağlayacak bu yola context denir
            //view içinde context.insert context.delete kullanarak database te değişiklik yapabiliriz.
        }
    }
}

// MARK: - Birthdays View
@available(iOS 17, *)
struct BirthdaysSwiftData: View {
    //@State private var friends: [Friend] = [Friend(name: "Elton Lin", birthday: .now)]
    @Query private var friends: [Friend]//set edemeyiz otomatik olarak Database teki friends ile set ediliyor
    //@Query, database ten kolay ve hızlı bir şekilde veri çekmek için kullanılıyor
    //database teki veriler değiştiğinde View lerin otomatik olarak güncellenmesini sağlar(@State gibi çalışıyor).
    
    //@Query(sort: \Friend.birthday) var friends: [Friend]
    //sort: friends listesi doğum günlerine göre kronolojik olarak sıralanacak.
    //buradaki backslash (\) a key path denir
    //sort: a birthday değerini değil onun referans ını veriyor(pointer yani)
    
    //@Query(sort: [SortDescriptor(\Friend.birthday, order: .reverse), SortDescriptor(\Friend.name)]) var friends: [Friend]
    //order: .reverse demek en yeni tarihler en üstte görünür demek (azalan sırada)
    //İkinci Sıralama: Aynı doğum gününe sahip arkadaşlar isimlerine göre A-Z (artan) sıralanır
    
    //@Query(filter: #Predicate<Friend>{$0.name.contains("A")}) var friends: [Friend]
    //filtrelemek için Predicate kullanıyoruz
    //Predicate, verilen bir koşula uyan verileri filtrelemek için kullanılıyor.
    //Sadece isminin içinde "A" harfi geçen Friend , friends listesine dahil edilir.
    
    
    @Environment(\.modelContext) private var modelContext//App teki modelContainer tarafından set ediliyor.
    //@Environment uygulamanın çevresel durum bilgilerini (environment values) kullanıcının erişimine sunar.
    //Environment values : uygulama genelinde sistem tarafından önceden tanımlanmış değerler veya davranışlardır. (current time zone, locale, colorScheme dark yada light, dismiss gibi burada modelContext kullandık) bir de biz custom environment value tanımlayabiliriz.
    //modelContext: Database taki verilerle etkileşim kurmak için kullanılan bir araçtır. yani verilerin kaydedilmesi, güncellenmesi ve silinmesi işlemleri için kullanılıyor.
    
    
    @State private var newName = ""
    //View e erişemediğimiz için TextField e erişip text okuyamayız
    //o yüzden @State newName kullandık binding olarak TextField e verdik
    @State private var newDate = Date.now
    //View e erişemediğimiz için DatePicker e erişip seçili tarihi okuyamayız
    //o yüzden @State newDate kullandık binding olarak DatePicker a verdik
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(friends) { friend in
                    HStack {
                        if friend.isBirthdayToday {
                            Image(systemName: "birthday.cake")
                        }
                        //@State olmadığı için $friend.birthday yazamayız yerine bindingBirthday kullandık
                        DatePicker(
                            selection: friend.bindingBirthday,
                            in: Date.distantPast...Date.now,//kullanıcı gelecekte bir tarih seçemez.
                            displayedComponents: .date) {
                                TextField("Add Name", text: friend.bindingName)
                                //@State olmadığı için $friend.name yazamayız yerine bindingName kullandık
                                    .bold(friend.isBirthdayToday)
                            }
                        //Spacer()
                        //Text(friend.birthday,
                        //     format: .dateTime.day().month(.wide).year())
                        
                    }
                }
                .onDelete(perform: deleteFriend)
                //listedeki itemleri silmek için kullanılıyor
                //Kullanıcının bir item i sola kaydırarak silmesine izin verir
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    HStack {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                        DatePicker(selection: $newDate,
                                   in: Date.distantPast...Date.now,//kullanıcı gelecekte bir tarih seçemez.
                                   displayedComponents: .date){}
                            .labelsHidden()
                    }
                    Button("Save") {
                        addNewFriend()
                    }
                    .bold()
                }
                .padding()
                .background(.bar)//.bar styles the background in the same style as a system toolbar.
            }
            .task {
                //View görünmeden önce .task içindeki kod çalışacak(viewWillAppear gibi)
                //modelContext.insert(Friend(name: "Elton Lin", birthday: .now))
                //modelContext.insert(Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0)))
                //@Query bunları çeker ve friends listesi güncellenir.
            }
        }
    }
    
    private func addNewFriend() {
        let newFriend = Friend(name: newName, birthday: newDate)
        //friends.append(newFriend)
        modelContext.insert(newFriend)//database e yeni satır eklenecek.
        //SwiftData otomatik kaydediyor. modelContext.save() gerek yok
        //database teki veriler değiştiği için View ler otomatik olarak güncelleniyor
        //friends listesine yeni Friend eklenecek.
        newName = ""
        newDate = .now
    }
    
    private func deleteFriend(offsets: IndexSet) {
        //IndexSet kullanarak belirtilen indekslerdeki itemleri listeden kaldırıyoruz.
        let friend = friends[offsets.first!]//offsets içinde hep bir item olacak çünkü sadece bir satır kaydırıyoruz
        modelContext.delete(friend)
        //SwiftData ilgili itemi database den kaldırıp otomatik olarak kaydediyor. modelContext.save() gerek yok
    }
}

@available(iOS 17, *)
#Preview {
    BirthdaysSwiftData()
        .modelContainer(for: Friend.self, inMemory: true)
    //Preview her yenilendiğinde aynı başlangıç ​​durumunda başlamak için .modelContainer kullandık,
    //inMemory modunda, veriler yalnızca uygulama çalıştığı sürece bellekte(RAM da) tutulur ve uygulama kapandığında tamamen silinir.
}
