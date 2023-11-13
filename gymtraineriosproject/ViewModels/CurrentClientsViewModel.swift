import Foundation
import Firebase

class CurrentClientsViewModel: ObservableObject {
    @Published var clientsList = [GymClient]()
    @Published var addClientViewModel = AddClientViewModel()
    
    @Published var name: String
    @Published var age: String
    @Published var weight: Double
    @Published var weightGoal: Double
    @Published var gender: String
    
    init() {
        self.name = ""
        self.age = ""
        self.weight = 0.0
        self.gender = "Male"
        self.weightGoal = 0.0
    }
    
    func getClients() {
        let db = Firestore.firestore()
        
        db.collection("clients").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.clientsList = snapshot.documents.map { doc in
                            return GymClient(id: doc.documentID, name: doc["name"] as? String ?? "", age: doc["age"] as? String ?? "", gender: doc["gender"] as? String ?? "", weight: doc["weight"] as? Double ?? 0.0, weightGoal: doc["weightGoal"] as? Double ?? 0.0)
                        }
                        
                    }
                }
            }
        }
    }
    
    func addClient(name: String, age: String, gender: String, weight: Double, weightGoal: Double) {
        let db = Firestore.firestore()

        db.collection("clients").addDocument(data: [
            "name": name,
            "age": age,
            "gender": gender,
            "weight": weight,
            "weightGoal": weightGoal
        ]) { [weak self] error in
            if error == nil {
                // Successfully added to Firestore, update the local clientsList
                self?.getClients()
            } else {
                // Handle error
                print("Error adding client: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    func updateWeightAndGoal(client: GymClient) {
        let db = Firestore.firestore()

        db.collection("clients").document(client.id).updateData([
            "weight": client.weight,
            "weightGoal": client.weightGoal
        ]) { error in
            if let error = error {
                print("Error updating weight and weight goal: \(error.localizedDescription)")
            } else {
                print("Weight and weight goal updated successfully.")
                self.getClients()
            }
        }
    }

    func deleteClient(_ client: GymClient) {
            let db = Firestore.firestore()
            let documentID = client.id

            // Remove the client from the local clientsList
            if let index = clientsList.firstIndex(where: { $0.id == documentID }) {
                clientsList.remove(at: index)
            }

            // Delete the client from Firestore
            db.collection("clients").document(documentID).delete { error in
                if let error = error {
                    print("Error deleting client: \(error.localizedDescription)")
                } else {
                    print("Client deleted successfully.")
                }
            }
        }
}
