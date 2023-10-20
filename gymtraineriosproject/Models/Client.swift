import SwiftUI

class Client: ObservableObject, Identifiable{
    @Published var id = UUID()
    @Published var name: String
    @Published var age: String
    @Published var weight: Double
    @Published var gender: String
    @Published var weightGoal: Double
    @Published var progressEntries: [ProgressEntry] = []
    
    init(name: String, age: String, weight: Double, gender: String, weightGoal: Double) {
        self.name = name
        self.age = age
        self.weight = weight
        self.gender = gender
        self.weightGoal = weightGoal
        self.progressEntries = []
        
    }
    
    func addProgressEntry(_ entry: ProgressEntry) {
        progressEntries.append(entry)
    }
    
}


