//
//  Friend.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 15.01.2025.
//

import Foundation
import SwiftData
//SwiftData, local database sağlamak için kullanılan yeni bir framework.
//SwiftData, Apple'ın önceki Core Data framework'üne modern bir alternatif olarak geliştirilmiştir
//ve Swift dilinin özelliklerinden tam anlamıyla yararlanarak daha basit, okunabilir ve güçlü bir API sunar.

@available(iOS 17, *)// SwiftData yalnızca iOS 17 veya daha yeni sürümlerde kullanılıyor.
@Model//@Model (macro or annotation) converts a Swift class into a stored model managed by SwiftData.
//@Model bu sınıfın SwiftData tarafından bir database modeli olarak kullanılabileceğini belirtir.
//@Model Class ile kullanılmalı struct olmaz.
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {//@Model, 'Friend' için bir initializer sağlanmasını gerektirir.
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
        //tarihinin bugünkü tarih olup olmadığını kontrol eder ve bir Bool döndürür. Eğer bugünle eşleşiyorsa true, eşleşmiyorsa false döner.
    }
}
