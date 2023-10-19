import Foundation

class ClientProgressViewModel: ObservableObject {
    @Published var client: Client
    @Published var progressEntries: [ProgressEntry] = []

    init(client: Client) {
        self.client = client
    }

    func addProgressEntry(date: Date, weight: Double) {
        // Create a new progress entry and add it to the progressEntries array
        let newEntry = ProgressEntry(date: date, weight: weight)
        progressEntries.append(newEntry)
    }
}
