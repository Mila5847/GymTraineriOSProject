import SwiftUI

struct DateWeightView: View {
    let date: Date
    let weight: Double
    
    var body: some View {
        HStack {
            Text("Date: \(date, style: .date)")
            Spacer()
            Text("Weight: \(String(format: "%.2f", weight)) kg")
        }
    }
}


struct ClientProgressView: View {
    @ObservedObject var viewModel: ClientProgressViewModel
    //@ObservedObject var viewModelCurrentClients: CurrentClientsViewModel
    @State private var newDate = Date()
    @State private var newWeight = 0.0
    @State private var isShowingForm = false
   
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Client: \(viewModel.client.name)")
                    .font(.title)
                    .padding()
                
                Text("Current Weight \(String(format: "%.2f", viewModel.client.weight))")
                Text("Weight Goal \(String(format: "%.2f", viewModel.client.weightGoal))")

                if(viewModel.client.weight == viewModel.client.weightGoal){
                    CompleteGoalView()
                }
                if(viewModel.client.weight - viewModel.client.weightGoal) > 0 {
                    Text("Goal: Lose \(String(format: "%.2f", viewModel.client.weight - viewModel.client.weightGoal)) kilograms")
                        .font(.headline)
                        .padding()
                } else {
                    Text("Goal: Gain \(String(format: "%.2f", viewModel.client.weightGoal - viewModel.client.weight)) kilograms")
                        .font(.headline)
                        .padding()
                }
                List {
                    ForEach(viewModel.progressEntries) { entry in
                        DateWeightView(date: entry.date, weight: entry.weight)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)))
                .padding(.bottom, 10)
                
                Button(action: {
                    isShowingForm.toggle()
                }) {
                    Text("Add Progress Entry")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)))            .navigationTitle("Client Progress")
        }
        .sheet(isPresented: $isShowingForm, content: {
            AddProgressEntryView(isPresented: $isShowingForm, viewModelProgress: viewModel)
         })
        }
}
