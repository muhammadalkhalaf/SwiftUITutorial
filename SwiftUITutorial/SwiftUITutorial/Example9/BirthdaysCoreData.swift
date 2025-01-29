//
//  BirthdaysCoreData.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 28.01.2025.
//

import SwiftUI
import CoreData

@main
struct BirthdaysCoreDataApp: App {
    let coreDataController = CoreDataController.shared
    
    var body: some Scene {
        WindowGroup {
            BirthdaysCoreData()
                .environment(\.managedObjectContext, coreDataController.container.viewContext)
            //.modelContainer(for: Friend.self)
        }
    }
}

// MARK: - Birthdays View
struct BirthdaysCoreData: View {
    @FetchRequest(entity: FriendCoreData.entity(), sortDescriptors: [])
    private var friends: FetchedResults<FriendCoreData>
    //@Query var friends: [Friend]
    
//    @FetchRequest(entity: FriendCoreData.entity(),
//                  sortDescriptors: [NSSortDescriptor(keyPath: \FriendCoreData.birthday, ascending: false)])
//    private var friends: FetchedResults<FriendCoreData>
    //@Query(sort: [SortDescriptor(\Friend.birthday, order: .reverse)]) var friends: [Friend]
    
//    @FetchRequest(
//        entity: FriendCoreData.entity(), sortDescriptors: [],
//        predicate: NSPredicate(format: "name CONTAINS %@", "A")//SQL query
//    ) private var friends: FetchedResults<FriendCoreData>
    //@Query(filter: #Predicate<Friend>{$0.name.contains("A")}) var friends: [Friend]
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    //@Environment(\.modelContext) private var modelContext
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    HStack {
                        if friend.isBirthdayToday {
                            Image(systemName: "birthday.cake")
                        }
                        DatePicker(
                            selection: friend.bindingDate,
                            in: Date.distantPast...Date.now,
                            displayedComponents: .date) {
                                TextField("Add Name", text: friend.bindingName)
                                    .font(friend.isBirthdayToday ? .headline.bold() : .headline.weight(.regular))
                            }
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
                               in: Date.distantPast...Date.now,
                               displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        addNewFriend()
                    }
                    .font(.title.bold())
                }
                .padding()
                .background(.bar)
            }
        }
    }
    
    private func addNewFriend() {
        let newFriend = FriendCoreData(context: managedObjectContext)//database e yeni satır eklenecek.
        //modelContext.insert(newFriend)
        newFriend.name = newName
        newFriend.birthday = newDate
        saveContext()//CoreData otomatik kaydetmiyor, Biz elle kaydediyoruz.
        newName = ""
        newDate = .now
    }
    
    private func deleteFriend(offsets: IndexSet) {
        //offsets.map { friends[$0] }.forEach(managedObjectContext.delete)
        for index in offsets {
            let friend = friends[index]
            managedObjectContext.delete(friend)
        }
        saveContext()//CoreData otomatik kaydetmiyor, Biz elle kaydediyoruz.
    }
    
    private func saveContext() {
        CoreDataController.shared.saveContext()
    }
}

#Preview {
    BirthdaysCoreData()
}
