import Foundation

class ClientProgressViewModel: ObservableObject {
    @Published var client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func addProgressEntry(date: Date, weight: Double) {
        let newEntry = ProgressEntry(date: date, weight: weight)
        client.addProgressEntry(newEntry)
    }
    
    func getProgressEntries() -> [ProgressEntry] {
        print("CLIENTS ON PROGRESS VIEW \(client.progressEntries)")
        return client.progressEntries
    }
}
