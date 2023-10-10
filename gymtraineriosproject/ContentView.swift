import SwiftUI

struct ContentView: View {
    @StateObject var currentClientsViewModel = CurrentClientsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("dumbell")
                    .resizable()
                    .scaledToFit()

                NavigationLink(destination: CurrentClientsView(viewModel: currentClientsViewModel)) {
                    Text("Current ")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

