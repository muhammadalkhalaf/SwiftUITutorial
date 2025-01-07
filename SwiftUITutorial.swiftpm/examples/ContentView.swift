import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            
            Text("Hello, world!")
                .fontWeight(.bold)
                .padding()
                .background(.yellow,
                            in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
                .font(.headline)
                .foregroundStyle(.primary)

            Text("Hello, world!")
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
        }
    }
}

#Preview {
    ContentView()
}
