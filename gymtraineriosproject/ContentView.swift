import SwiftUI

struct ContentView: View {
    @ObservedObject var currentClientsViewModel = CurrentClientsViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Image("gymBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    NavigationLink(destination: CurrentClientsView(viewModel: currentClientsViewModel)) {
                        Text("Current Clients")
                            .font(.title)
                            .padding()
                            .background(Color(#colorLiteral(red: 0.9254902005, green: 0.5725490451, blue: 0.3568627536, alpha: 1)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
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



