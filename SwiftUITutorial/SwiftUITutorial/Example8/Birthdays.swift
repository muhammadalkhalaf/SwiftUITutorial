//
//  Birthdays.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 15.01.2025.
//

import SwiftUI

@available(iOS 17, *)
struct Birthdays: View {
    @State private var friends: [Friend] = [
        Friend(name: "Elton Lin", birthday: .now),
        Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday,
                         format: .dateTime.day().month(.wide).year())
                    
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate,
                               in: Date.distantPast...Date.now,//user can’t select a date in the future.
                               displayedComponents: .date) {
//                        The closure following DatePicker contains its label. The “New Birthday” title describes what goes into the date picker just fine, so use the label to display the TextField.
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        //View e erişemediğimiz için DatePicker e erişip selected date i okuyamayız
                        //o yüzden @State newDate kullandık (TextField için aynı şey)
                        let newFriend = Friend(name: newName, birthday: newDate)
                        friends.append(newFriend)
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)//.bar styles the background in the same style as a system toolbar.
            }
        }
    }
}

@available(iOS 17, *)
#Preview {
    Birthdays()
}
