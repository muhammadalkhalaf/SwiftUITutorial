//
//  Altakhassusi.swift
//  SwiftUITutorial
//
//  Created by Muhammad Alkhalaf on 28.03.2025.
//

import SwiftUI

struct Service: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct Altakhassusi: View {
    @State private var selectedLanguage = "عربي"
    let languages = ["عربي", "English"]
    let services = [
        Service(title: "Surgery Monitoring Board", description: "Track your patient's surgery journey anywhere, anytime"),
        Service(title: "Find a Doctor", description: "Our find a doctor tool allows you to familiarize yourself with our team of diverse healthcare professionals and their patients ratings."),
        Service(title: "Ehalat", description: "Welcome to Ehalat, a service through which you can apply for a medical treatment"),
        Service(title: "Pharmacy", description: "Find the nearest pharmacy and check medicine availability"),
        Service(title: "Medical Records", description: "Access your medical history and lab results anytime"),
        Service(title: "Emergency Services", description: "Get emergency assistance and quick response medical aid")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Menu {
                    ForEach(languages, id: \.self) { language in
                        Button(language) {
                            selectedLanguage = language
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedLanguage)
                        Image(systemName: "chevron.down")
                    }
                    .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("Altakhassusi")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "questionmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.leading, 32)
                }
            }
            .padding()
            .background(Color.green)
            
            // Tabs
            HStack {
                Spacer()
                
                Text("Patient Services")
                    .foregroundColor(.gray)
                
                Spacer()
                Spacer()
                
                Text("Public Services")
                    .foregroundColor(.green)
                    .bold()
                
                Spacer()
            }
            .padding(.horizontal)
            
            ZStack(alignment: .trailing) {
                // Tab Indicator
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray.opacity(0.3))
                Rectangle()
                    .frame(width:UIScreen.main.bounds.width / 2.0, height: 2)
                    .foregroundColor(.green)
            }
            
            // Content (Dynamic Service Cards in Grid)
            ScrollView {
                
                Image("altakhassusi_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(services) { service in
                        ServiceCard(title: service.title, description: service.description)
                    }
                }
                .padding()
            }
        }
    }
}

struct ServiceCard: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal, 5)

            Spacer()
            
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 5)
            
            Spacer()
            
            Button(action: {}) {
                Text("Go To Service")
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .clipShape(RoundedCorner(radius: 8, corners: [.bottomLeft, .bottomRight]))
            }
        }
        .padding(.top)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

#Preview {
    Altakhassusi()
}


struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
