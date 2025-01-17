//
//  SettingsView.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 13.01.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
//@Binding @State gibi davranıyor ama değişikliği dış ekrandaki değişkene geçiriyor (dış ekran parent view demek)
//@State hep private olması lazım, o yüzden değişikliği parent view e geçiremez
//@Binding sadece value type için kullanılıyor structs, Int ..(@State gibi)
//@Binding burada set edilmez hep parent view üzerinden init edilmesi lazım
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win condition", selection: $doesHighestScoreWin) {
                Text("Highest Score Wins")
                    .tag(true)
                Text("Lowest Score Wins")
                    .tag(false)
            }
            Picker("Starting points", selection: $startingPoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints)
}
