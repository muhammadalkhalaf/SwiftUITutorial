//
//  Friend.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 15.01.2025.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model//@Model converts a Swift class into a stored model managed by SwiftData.
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
