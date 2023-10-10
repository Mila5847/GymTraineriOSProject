import SwiftUI
struct AddClientView: View {
    @ObservedObject var viewModelAddClient: AddClientViewModel
    @ObservedObject var viewModelCurrentClient: CurrentClientsViewModel

    var body: some View {
        Form {
            Section(header: Text("Client Details")) {
                TextField("Name", text: $viewModelAddClient.name)
                Picker("Gender", selection: $viewModelAddClient.selectedGender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
                Stepper("Age: \(viewModelAddClient.age)", value: $viewModelAddClient.age, in: 0...150)
                Slider(value: $viewModelAddClient.weight, in: 0...300, step: 0.1) {
                    Text("Weight: \(viewModelAddClient.weight, specifier: "%.1f") kg")
                }
            }

            Section {
                Button("Add Client") {
                    viewModelAddClient.addClient(to: viewModelCurrentClient)
                }
            }
        }
        .navigationTitle("Add Client")
    }
}


