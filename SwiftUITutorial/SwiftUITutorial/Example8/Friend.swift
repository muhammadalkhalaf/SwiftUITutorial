//
//  Friend.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 15.01.2025.
//https://developer.apple.com/tutorials/develop-in-swift/save-data

import SwiftUI
import SwiftData
//SwiftData, local database sağlamak için kullanılan yeni bir framework.
//SwiftData, Apple'ın önceki Core Data framework'üne modern bir alternatif olarak geliştirilmiştir
//ve Swift dilinin özelliklerinden tam anlamıyla yararlanarak daha basit, okunabilir ve güçlü bir API sunar.
//SwiftData yalnızca iOS 17 veya daha yeni sürümlerde kullanılıyor.
//iPhone X ve 8 e kadar çalışmayacak, iPhone XR, XS, SE(2nd), 11 ve sonrası çalışabilir.
@available(iOS 17, *)
@Model
class Friend {
    @Attribute(.unique) var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {//@Model, 'Friend' için bir initializer sağlanmasını gerektirir.
        self.name = name
        self.birthday = birthday
    }
}

//@Model (macro or annotation) converts a Swift class into a stored model managed by SwiftData.
//@Model bu sınıfın SwiftData tarafından bir database modeli olarak kullanılabileceğini belirtir.
// yani artık bu normal class değil bu database ten bir table gibi sayılacak
//@Model Class ile kullanılmalı struct olmaz.
//@Attribute(.unique) SwiftData’da bir model özelliğinin benzersiz (unique) olmasını sağlamak için kullanılan bir özelliktir. Bir alanın tekrarlanmaması gerektiğinde kullanılır.

// MARK: - Friend extension
@available(iOS 17, *)
extension Friend {
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
        //tarihinin bugünkü tarih olup olmadığını kontrol eder ve bir Bool döndürür. Eğer bugünle eşleşiyorsa true, eşleşmiyorsa false döner.
    }
    
    var bindingName: Binding<String> {
        Binding(get: {
            self.name
        },
                set: {
            self.name = $0 //$0 gelen yeni değer demek name e set ettikten sonra otomatik olarak database e kaydediyor
        })
    }
    
    var bindingBirthday: Binding<Date> {
        Binding(get: {
            self.birthday
        },
                set: {
            self.birthday = $0 //$0 gelen yeni değer demek birthday e set ettikten sonra otomatik olarak database e kaydediyor
        })
    }
}

/*
 # SwiftData tarafından oluşturulan veritabanı dosyası nerede bulunur ?
 uygulamanın App Sandbox dizini içinde bulunur. Varsayılan olarak, SwiftData SQLite tabanlı bir dosya kullanır ve bu dosya genellikle şu path te yer alır:
 ~/Library/Containers/{BUNDLE_IDENTIFIER}/Data/Documents/
 # bu Library nerede bulunur?
 Sandbox'ta
 # Sandbox Nedir?
   Sandbox, iOS işletim sisteminde her uygulamanın kendi izole çalışma ortamında çalışmasını sağlayan güvenlik mekanizmasıdır. Bu sistem, uygulamaların birbirlerinin verilerine veya sistem dosyalarına doğrudan erişmesini engeller.
 # Uygulama İzolasyonu ne demek?
    - Her uygulamanın kendine ait bir dosya sistemi vardır ve başka bir uygulamanın verilerine erişemez.
    - Uygulamalar yalnızca kendi klasörlerine yazma/okuma iznine sahiptir.
    - Bir iOS uygulaması yüklendiğinde, uygulamaya özel bir dizin (sandbox) oluşturulur. Bu dizin aşağıdaki klasörleri içerir:

 # Uygulamanın Sandbox Dizini şöyle olabilir:
 private/var/containers/Bundle/Application/{UUID}/example.app/

Önemli Alt Dizinler:
 📁 Documents/    # Kullanıcı tarafından oluşturulan kalıcı veriler (örn. notlar, PDF'ler)
 📁 Library/      # Önbellekler ve ayarlar (Preferences UserDefaults database)
    📁 Preferences/
    📁 Caches/
 📁 tmp/           # Geçici dosyalar

 Daha fazla ayrıntı için şu videoyu izleyin:
 https://youtu.be/tSK460Nl9FA?si=gcCmD2uiW6NsQTgD
 */
