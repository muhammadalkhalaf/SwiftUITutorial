import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .padding()
                .background(.yellow, in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
        }
    }
}

#Preview {
    ContentView()
}
