import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            
            Text("Hello, world! 1")
                .fontWeight(.bold)
                .padding()
                .background(.yellow,
                            in: RoundedRectangle(cornerRadius: 8))
                .shadow(radius: 5)
                .font(.headline)
                .foregroundStyle(.primary)

            Text("Hello, world! 2")
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text("Hello, world! 3")
                .border(.orange)
                .padding()
                .border(.black)
            
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .circular)
                    .frame(width: 100, height: 100)
                    .border(.black, width: 2)
                    .background(.blue)
                    .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
