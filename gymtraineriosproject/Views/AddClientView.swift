import SwiftUI


struct AddClientView: View {
    @ObservedObject var viewModelCurrentClient: CurrentClientsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isShowingAlert = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("")) {
                    TextField("Name", text: $viewModelCurrentClient.name)
                        .keyboardType(.alphabet) // Allow only letters for name
                    Picker("Gender", selection: $viewModelCurrentClient.gender) {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female")
                    }
                    TextField("Age", text: $viewModelCurrentClient.age)
                        .keyboardType(.numberPad) // Allow only numbers for age
                    Slider(value: $viewModelCurrentClient.weight, in: 0...300, step: 1)
                    Text("Weight: \(Double(viewModelCurrentClient.weight), specifier: "%.1f") kg")
                    Slider(value: $viewModelCurrentClient.weightGoal, in: 0...300, step: 1)
                    Text("Weight Goal: \(Double(viewModelCurrentClient.weightGoal), specifier: "%.1f") kg")
                }
                
                Section(header: Text("")) {
                    Button(action: {
                        if !containsOnlyLetters(viewModelCurrentClient.name) || !containsOnlyNumbers(viewModelCurrentClient.age) {
                            
                            isShowingAlert = true
                        } else {
                        
                            viewModelCurrentClient.addClient(name: viewModelCurrentClient.name, age: viewModelCurrentClient.age, gender: viewModelCurrentClient.gender, weight: viewModelCurrentClient.weight, weightGoal: viewModelCurrentClient.weightGoal)
                            
                            viewModelCurrentClient.resetForm()
                            
                            presentationMode.wrappedValue.dismiss()
                        }
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
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Invalid Input"), message: Text("TextName should contain only letters and age should contain only numbers."), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func containsOnlyLetters(_ string: String) -> Bool {
        let letterCharacterSet = CharacterSet.letters
        return string.rangeOfCharacter(from: letterCharacterSet.inverted) == nil
    }

    private func containsOnlyNumbers(_ string: String) -> Bool {
        let numberCharacterSet = CharacterSet.decimalDigits
        return string.rangeOfCharacter(from: numberCharacterSet.inverted) == nil
    }
}







