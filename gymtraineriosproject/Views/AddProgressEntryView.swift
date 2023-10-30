import SwiftUI
struct AddProgressEntryView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ClientProgressViewModel
    @ObservedObject var viewModelCurrentclients: CurrentClientsViewModel
    @State private var newDate = Date()
    @State private var newWeightText = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigatingToClientProgress = false
    
    var newWeight: Double {
        if let weight = Double(newWeightText) {
            return weight
        } else {
            return 0.0
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Date", selection: $newDate, displayedComponents: .date)
                    TextField("Current Weight", text: $newWeightText)
                        .keyboardType(.decimalPad)
                    
                }.background(.white)
            }
        }.navigationBarTitle("Add Progress Entry", displayMode: .inline).background(.white)
        HStack{ Button(action: {
            isPresented = false
            presentationMode.wrappedValue.dismiss()
        }) {
            Text("Cancel")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
            Button(action: {
                               viewModel.addProgressEntryToClient(to: viewModelCurrentclients, date: newDate, weight: newWeight)
                               presentationMode.wrappedValue.dismiss()
                               isNavigatingToClientProgress = true
                           }) {
                               Text("Save")
                                   .foregroundColor(.white)
                                   .fontWeight(.bold)
                                   .padding()
                                   .background(Color.green)
                                   .cornerRadius(10)
                           }
                          
                       }
        }

    
}

