import SwiftUI

struct AddProgressEntryView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ClientProgressViewModel
    @State private var newDate = Date()
    @State private var newWeight = 0.0
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigatingToClientProgress = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Progress Entry")) {
                    DatePicker("Date", selection: $newDate, displayedComponents: .date)
                    TextField("Weight", text: Binding(
                        get: {
                            String(format: "%.2f", newWeight)
                        },
                        set: { newValue in
                            if let value = Double(newValue) {
                                newWeight = value
                            }
                        }
                    ))
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
                    viewModel.addProgressEntry(date: newDate, weight: newWeight)
                    presentationMode.wrappedValue.dismiss()
                    isNavigatingToClientProgress = true
                }
            )
        }
    }
}
