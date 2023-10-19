import SwiftUI

struct ContentView: View {
    @StateObject var currentClientsViewModel = CurrentClientsViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Image("fitnessBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    Spacer()
                    NavigationLink(destination: CurrentClientsView(viewModel: currentClientsViewModel)) {
                        Text("Current Clients")
                            .font(.title)
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    // Navigation link for settings
                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() // Pass an instance of Client here
    }
}



