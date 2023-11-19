import SwiftUI

struct ContentView: View {
    @ObservedObject var currentClientsViewModel = CurrentClientsViewModel()

    @AppStorage("isDarkMode") private var isDark = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("gymBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    NavigationLink(destination: CurrentClientsView()) {
                        Text("Current Clients")
                            .font(.title)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.9254902005, green: 0.5725490451, blue: 0.3568627536, alpha: 1)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()

                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.title)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.9254902005, green: 0.5725490451, blue: 0.3568627536, alpha: 1)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .shadow(color: Color.black.opacity(1), radius: 20)
            .onChange(of: isDark) { _ in
                // Handle appearance change here
                if isDark {
                    UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .dark
                } else {
                    UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = .light
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDark = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Dark Mode", isOn: $isDark)
                    .padding()
                    .foregroundColor(isDark ? .white : .black)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                Image("gymBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Image(systemName: "chevron.left.circle")
                        .imageScale(.large)
                        .foregroundColor(isDark ? .white : .black)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Text("Back")
                        .foregroundStyle(isDark ? .white : .black)
                }
            }
        }
    }
}

    

