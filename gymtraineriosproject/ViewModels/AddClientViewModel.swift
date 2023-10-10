import SwiftUI

class AddClientViewModel: ObservableObject {
    @Published var name: String
    @Published var age: Int
    @Published var weight: Double
    @Published var selectedGender: String

    init() {
        // Initialize the properties with default values here
        self.name = ""
        self.age = 0
        self.weight = 0.0
        self.selectedGender = "Male"
    }

    func addClient(to viewModel: CurrentClientsViewModel) {
        let newClient = Client(name: name, age: age, weight: weight, gender: selectedGender)
        viewModel.addClient(newClient)
    }
}
