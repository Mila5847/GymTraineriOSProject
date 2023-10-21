import SwiftUI

struct Client: Identifiable {
    var id = UUID()
    var name: String
    var age: String
    var weight: Double
    var gender: String
    var weightGoal: Double
    var progressEntries: [ProgressEntry] = []

    init(id:UUID = UUID(), name: String, age: String, weight: Double, gender: String, weightGoal: Double, progressEntries: [ProgressEntry] = []) {
        self.id = id
        self.name = name
        self.age = age
        self.weight = weight
        self.gender = gender
        self.weightGoal = weightGoal
        self.progressEntries = progressEntries
    }
    
    
    mutating func addProgressEntry(_ entry: ProgressEntry) {
        progressEntries.append(entry)
    }
    
    func getAllProgressEntries() -> [ProgressEntry] {
        return progressEntries
    }
}


