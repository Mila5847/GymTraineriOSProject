import SwiftUI

struct ClientProgressView: View {
    @ObservedObject var viewModel: ClientProgressViewModel
    @ObservedObject var viewModelCurrentClients: CurrentClientsViewModel
    @State private var newDate = Date()
    @State private var newWeight = 0.0
    @State private var isShowingForm = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Client: \(viewModel.client.name)")
                    .font(.title)
                    .padding()
                
                if viewModel.client.weightGoal >= viewModel.client.weight {
                    Text("Goal: Lose \(String(format: "%.2f", viewModel.client.weightGoal - viewModel.client.weight)) kilograms")
                        .font(.headline)
                        .padding()
                } else {
                    Text("Goal: Gain \(String(format: "%.2f", viewModel.client.weight - viewModel.client.weightGoal)) kilograms")
                        .font(.headline)
                        .padding()
                }
                List {
                    ForEach(viewModel.getProgressEntries(), id: \.date) { entry in
                        Text("Date: \(entry.date, style: .date), Weight: \(entry.weight ?? 0.0)")
                    }
                }
                Button("Add Progress Entry") {
                    isShowingForm.toggle()
                }
            }
            .navigationTitle("Client Progress")
        }
        
        .sheet(isPresented: $isShowingForm, content: {
            AddProgressEntryView(isPresented: $isShowingForm, viewModel: viewModel, viewModelCurrentclients: viewModelCurrentClients)
        })
    }
}
