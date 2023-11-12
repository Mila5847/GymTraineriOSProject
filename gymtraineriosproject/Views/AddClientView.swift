import SwiftUI

struct AddClientView: View {
    //@ObservedObject var viewModelAddClient: AddClientViewModel
    @ObservedObject var viewModelCurrentClient: CurrentClientsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Current Clients")) {
                TextField("Name", text: $viewModelCurrentClient.name)
                Picker("Gender", selection: $viewModelCurrentClient.gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
                TextField("Age", text: $viewModelCurrentClient.age)
                Slider(value: $viewModelCurrentClient.weight, in: 0...300, step: 1)
                Text("Weight: \(Double(viewModelCurrentClient.weight), specifier: "%.1f") kg")
                Slider(value: $viewModelCurrentClient.weightGoal, in: 0...300, step: 1)
                Text("Weight Goal: \(Double(viewModelCurrentClient.weightGoal), specifier: "%.1f") kg")
            }
            
            Section(header: Text("")) { // Empty header to separate sections
                Button(action: {
                    viewModelCurrentClient.addClient(name: viewModelCurrentClient.name, age: viewModelCurrentClient.age, gender: viewModelCurrentClient.gender, weight: viewModelCurrentClient.weight, weightGoal: viewModelCurrentClient.weightGoal)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Client")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .navigationTitle("Client")
    }
}






