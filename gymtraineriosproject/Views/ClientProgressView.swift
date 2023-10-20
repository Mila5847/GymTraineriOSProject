import SwiftUI

struct ClientProgressView: View {
    @ObservedObject var viewModel: ClientProgressViewModel
    var client: Client
    @State private var newDate = Date()
    @State private var newWeight = 0.0
    @State private var isPresentingAddProgressEntryScreen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Client: \(client.name)")
                    .font(.title)
                    .padding()
                
                if viewModel.client.weightGoal >= viewModel.client.weight {
                    Text("Goal: Lose \(String(format: "%.2f", client.weightGoal - client.weight)) kilograms")
                        .font(.headline)
                        .padding()
                } else {
                    Text("Goal: Gain \(String(format: "%.2f", viewModel.client.weight - viewModel.client.weightGoal)) kilograms")
                        .font(.headline)
                        .padding()
                }
                
                if (!isPresentingAddProgressEntryScreen){
                    List {
                                        ForEach(viewModel.getProgressEntries(), id: \.date) { entry in
                                            Text("Date: \(entry.date, style: .date), Weight: \(entry.weight)")
                                        }
                                    }
                }
                
                
                NavigationLink(destination: AddProgressEntryView(isPresented: $isPresentingAddProgressEntryScreen, viewModel: ProgressEntryViewModel(client: client))) {
                    Text("Add Progress Entry")
                }.navigationBarTitle("Progress")
                
            }
        }
    }
}






                /*struct ClientProgressView: View {
    @ObservedObject var viewModel: ClientProgressViewModel
    var client: Client
    @State private var newDate = Date()
    @State private var newWeight = 0.0
    @Environment(\.presentationMode) var presentationMode // Control navigation

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

            List {
                ForEach(viewModel.progressEntries, id: \.date) { entry in
                    Text("Date: \(entry.date, style: .date), Weight: \(entry.weight)")
                    
                }
            }
            
            Form {
                Section {
                    DatePicker("Date", selection: $newDate, displayedComponents: .date)
                    TextField("Weight (in kilograms)", value: $newWeight, formatter: NumberFormatter())
                }
            }

            Button("Add Progress Entry") {
                // Add the new progress entry to your view model's client
                viewModel.addProgressEntry(date: newDate, weight: newWeight)
                // You might want to reset newDate and newWeight here

                // Dismiss this view to navigate back
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle("Progress")
    }
}*/


