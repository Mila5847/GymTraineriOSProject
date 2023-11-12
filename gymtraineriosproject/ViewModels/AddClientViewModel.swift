import Foundation
import Firebase

class AddClientViewModel: ObservableObject {
    @Published var clientsList = [GymClient]()
    
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

         db.collection("clients").getDocuments { [weak self] snapshot, error in
             guard error == nil, let snapshot = snapshot else { return }

             DispatchQueue.main.async {
                 self?.clientsList = snapshot.documents.map { doc in
                     return GymClient(id: doc.documentID, name: doc["name"] as? String ?? "", age: doc["age"] as? String ?? "", gender: doc["gender"] as? String ?? "", weight: doc["weight"] as? Double ?? 0.0, weightGoal: doc["weightGoal"] as? Double ?? 0.0)
                 }

                 // Notify observers that the data is updated
                 self?.objectWillChange.send()
             }
         }
     }

}



