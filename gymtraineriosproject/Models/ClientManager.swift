import Foundation

struct ClientManager {
    private var clients: [Client] = []

    // Add a new client to the manager
    mutating func addClient(_ client: Client) {
        clients.append(client)
    }

    // Remove a client from the manager by ID
    mutating func removeClient(withID id: UUID) {
        if let index = clients.firstIndex(where: { $0.id == id }) {
            clients.remove(at: index)
        }
    }

    // Retrieve all clients
    func getAllClients() -> [Client] {
        return clients
    }
}
