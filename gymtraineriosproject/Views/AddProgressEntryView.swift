import SwiftUI

struct AddProgressEntryView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: ProgressEntryViewModel
    
    @State private var isNavigatingToClientProgress = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Progress Entry")) {
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    TextField("Weight", text: $viewModel.weight)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Add Progress Entry")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        isPresented = false
                    },
                trailing:
                    Button("Save") {
                        viewModel.saveProgressEntry()
                        isPresented = false
                        isNavigatingToClientProgress = true
                    }
            )
            .background(
                NavigationLink(
                    "", // Empty label, won't be visible
                    destination: ClientProgressView(viewModel: ClientProgressViewModel(client: viewModel.client), client: viewModel.client),
                    isActive: $isNavigatingToClientProgress
                )
            )
        }
    }
}

/*struct AddProgressEntryView: View {
    @Binding var isPresented: Bool
        @ObservedObject var viewModel: ProgressEntryViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add Progress Entry")) {
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                    TextField("Weight", text: $viewModel.weight)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationBarTitle("Add Progress Entry")
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        isPresented = false
                    },
                trailing:
                    Button("Save") {
                        viewModel.saveProgressEntry()
                        isPresented = false
                    }
            )
    }
}*/


