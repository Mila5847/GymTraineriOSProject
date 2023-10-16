import SwiftUI
struct AddProgressEntryView: View {
    @StateObject var progressViewModel = ProgressEntryViewModel()
    @Binding var client: Client
    @Binding var isAddingProgress: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Progress Entry")) {
                    DatePicker("Date", selection: $progressViewModel.date, displayedComponents: .date)
                    TextField("Weight", text: $progressViewModel.weight)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Add Progress Entry")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        isAddingProgress = false
                    },
                trailing:
                    Button("Save") {
                        if let weight = Double(progressViewModel.weight) {
                            let progressEntry = ProgressEntry(date: progressViewModel.date, weight: weight)
                            client.addProgressEntry(progressEntry)
                            isAddingProgress = false
                        }
                    }

            )
        }
    }
}

