//
//  CoreDataController.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 29.01.2025.
//

import SwiftUI
import CoreData

class CoreDataController {
    static let shared = CoreDataController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "Friend")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    func saveContext() {
        do {
            try container.viewContext.save()
        } catch {
            fatalError("Failed to save context: \(error)")
        }
    }
}

// MARK: - FriendCoreData extension
extension FriendCoreData {
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday!)
    }
    
    var bindingName: Binding<String> {
        Binding(get: {
            self.name!
        },
                set: {
            self.name = $0
            CoreDataController.shared.saveContext()//CoreData otomatik kaydetmiyor, Biz elle kaydediyoruz.
        })
    }
    
    var bindingDate : Binding<Date> {
        Binding(get: {
            self.birthday!
        },
                set:{
            self.birthday = $0
            CoreDataController.shared.saveContext()//CoreData otomatik kaydetmiyor, Biz elle kaydediyoruz.
        })
    }
}
