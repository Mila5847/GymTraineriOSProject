import SwiftUI

class AddClientViewModel: ObservableObject {
    @Published var name: String
    @Published var age: String
    @Published var weight: Double
    @Published var selectedGender: String
    @Published var weightGoal: Double

    init() {
        // Initialize the properties with default values here
        self.name = ""
        self.age = ""
        self.weight = 0.0
        self.selectedGender = "Male"
        self.weightGoal = 0.0
    }

    func addClient(to viewModel: CurrentClientsViewModel) {
        let newClient = Client(name: name, age: age, weight: weight, gender: selectedGender, weightGoal: weightGoal)
        viewModel.addClient(newClient)
        
        // Reset the input fields
        name = ""
        age = ""
        weight = 0.0
        selectedGender = "Male"
    }
}



