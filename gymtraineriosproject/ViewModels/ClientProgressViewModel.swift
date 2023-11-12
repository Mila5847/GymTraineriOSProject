import Foundation
import Firebase

class ClientProgressViewModel: ObservableObject {
    @Published var progressEntries = [ProgressEntry]()

    @Published var date: Date = Date()
    @Published var weightString: String = ""

    var weight: Double {
        return Double(weightString) ?? 0.0
    }

    var client: GymClient

    init(client: GymClient) {
        self.client = client
        getProgressEntries()
    }

    func getProgressEntries() {
        let db = Firestore.firestore()
        
        db.collection("progressEntries")
            .whereField("clientId", isEqualTo: client.id)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting progress entries: \(error.localizedDescription)")
                    return
                }
                
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.progressEntries = snapshot.documents.map { doc in
                            return ProgressEntry(
                                id: doc.documentID,
                                date: (doc["date"] as? Timestamp)?.dateValue() ?? Date(),
                                weight: doc["weight"] as? Double ?? 0.0,
                                clientId: doc["clientId"] as? String ?? ""
                            )
                        }
                    }
                }
            }
    }
    
    func addProgressEntry() {
            let db = Firestore.firestore()

            // Assuming you have a function to get the client ID from the selected client
            guard let clientId = getClientId() else {
                print("Error: Unable to get client ID.")
                return
            }

            db.collection("progressEntries").addDocument(data: [
                "clientId": clientId,
                "date": date,
                "weight": weight
            ]) { [weak self] error in
                if error == nil {
                    // Successfully added to Firestore
                    // Additional logic if needed
                    self?.getProgressEntries() // Update progress entries after adding
                } else {
                    // Handle error
                    print("Error adding progress entry: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    
    func getClientId() -> String? {
            return client.id
        }
}
