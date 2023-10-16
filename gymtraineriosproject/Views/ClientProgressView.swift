import SwiftUI



struct ClientProgressView: View {
    var client: Client

    var body: some View {
        VStack {
            Text("Client: \(client.name)")
                .font(.title)
                .padding()

            if client.weightGoal >= client.weight {
                Text("Goal: Lose \(String(format: "%.2f", client.weightGoal - client.weight)) kilograms")
                    .font(.headline)
                    .padding()
            } else {
                Text("Goal: Gain \(String(format: "%.2f", client.weight - client.weightGoal)) kilograms")
                    .font(.headline)
                    .padding()
            }
        }
        .navigationBarTitle("Progress")
     
    }
}



