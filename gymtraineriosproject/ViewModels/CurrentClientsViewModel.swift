import Foundation

class CurrentClientsViewModel: ObservableObject {
    @Published var clients: [Client] = []
    @Published var addClientViewModel = AddClientViewModel()

    init() {
        // Initialize the clients data here
        clients = [
            Client(name: "John Doe", age: 20, weight: 80.5, gender: "Male"),
            Client(name: "Jane Smith", age: 23, weight: 70.0, gender: "Female"),
            Client(name: "Emily Doe", age: 19, weight: 75.5, gender: "Male"),
            Client(name: "James Smith", age: 24, weight: 65.0, gender: "Female"),
            Client(name: "Jonathan Doe", age: 36, weight: 75.5, gender: "Male"),
            Client(name: "Alexandre Dubois", age: 27, weight: 65.0, gender: "Female"),
            Client(name: "John Doe", age: 20, weight: 75.5, gender: "Male"),
            Client(name: "Jane Smith", age: 21, weight: 65.0, gender: "Female"),
            Client(name: "Emily Doe", age: 20, weight: 75.5, gender: "Male"),
            Client(name: "James Smith", age: 24, weight: 65.0, gender: "Female"),
            Client(name: "Jonathan Doe", age: 36, weight: 75.5, gender: "Male"),
            Client(name: "Alexandre Dubois", age: 27, weight: 65.0, gender: "Female")
        ]
    }

    func removeClient(_ client: Client) {
        clients.removeAll { $0.id == client.id }
    }

    func addClient(_ client: Client) {
        clients.append(client)
    }
}
