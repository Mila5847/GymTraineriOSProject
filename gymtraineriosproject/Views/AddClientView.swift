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
                TextField("Age", text: $viewModelAddClient.age)
                Slider(value: $viewModelAddClient.weight, in: 0...300, step: 1)
                Text("Weight: \(Double(viewModelAddClient.weight), specifier: "%.1f") kg")
                Slider(value: $viewModelAddClient.weightGoal, in: 0...300, step: 1)
                Text("Weight Goal: \(Double(viewModelAddClient.weightGoal), specifier: "%.1f") kg")            }

            Section {
                Button("Add Client") {
                    viewModelAddClient.addClient(to: viewModelCurrentClient)
                }
            }
        }
        .navigationTitle("Add Client")
    }
} 



