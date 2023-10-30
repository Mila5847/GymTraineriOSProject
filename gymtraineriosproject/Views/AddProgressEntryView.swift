import SwiftUI

struct AddProgressEntryView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ClientProgressViewModel
    @ObservedObject var viewModelCurrentclients: CurrentClientsViewModel
    @State private var newDate = Date()
    @State private var newWeightText = "" // Represent newWeight as a String
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
                Section(header: Text("Add Progress Entry")) {
                    DatePicker("Date", selection: $newDate, displayedComponents: .date)
                    TextField("Weight", text: $newWeightText)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Add Progress Entry", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    viewModel.addProgressEntryToClient(to: viewModelCurrentclients, date: newDate, weight: newWeight)
                    presentationMode.wrappedValue.dismiss()
                    isNavigatingToClientProgress = true
                }
            )
        }
    }
}
