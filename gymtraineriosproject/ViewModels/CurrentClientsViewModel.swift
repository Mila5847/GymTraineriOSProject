import Foundation

class CurrentClientsViewModel: ObservableObject {
    @Published var clients: [Client] = []
    @Published var addClientViewModel = AddClientViewModel()

    let date = Date()
    init() {
        // Initialize the clients data here
        clients = [
            Client(name: "John Doe", age: "20", weight: 80.5, gender: "Male", weightGoal: 70.0, progressEntries: [ProgressEntry(date: date, weight: 60.0)]),
            Client(name: "Jane Smith", age: "23", weight: 70.0, gender: "Female", weightGoal: 60.0),
            Client(name: "Emily Doe", age: "19", weight: 75.5, gender: "Female", weightGoal: 70.0),
            Client(name: "James Smith", age: "24", weight: 65.0, gender: "Male", weightGoal: 70.0),
            Client(name: "Jonathan Doe", age: "36", weight: 75.5, gender: "Male", weightGoal: 80.0),
            Client(name: "Alexandre Dubois", age: "27", weight: 65.0, gender: "Male", weightGoal: 70.0),
            Client(name: "John Doe", age: "20", weight: 75.5, gender: "Male", weightGoal: 80.0),
            Client(name: "Jane Smith", age: "21", weight: 65.0, gender: "Female", weightGoal: 6.0),
            Client(name: "Emily Doe", age: "20", weight: 75.5, gender: "Female", weightGoal: 60.0),
            Client(name: "James Smith", age: "24", weight: 65.0, gender: "Male", weightGoal: 75.0),
            Client(name: "Jonathan Doe", age: "36", weight: 75.5, gender: "Male" , weightGoal: 80.0),
            Client(name: "Alexandre Dubois", age: "27", weight: 65.0, gender: "Male", weightGoal: 70.0)
        ]
    }

    func removeClient(_ client: Client) {
        clients.removeAll { $0.id == client.id }
    }

    func addClient(_ client: Client) {
        clients.append(client)
    }
    
    func addProgressEntryToClient(to client:Client, progressEntry: ProgressEntry) {
        if let clientIndex = clients.firstIndex(where: { $0.id == client.id }) {
            // Find the client in the array based on their id
            clients[clientIndex].progressEntries.append(progressEntry)
        }
    }
    
}
