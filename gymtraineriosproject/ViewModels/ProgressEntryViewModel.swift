import Foundation
import SwiftUI

struct ProgressEntry {
    var date: Date
    var weight: Double
}

class ProgressEntryViewModel: ObservableObject {
    @Published var client: Client
    @Published var isAddingProgress: Bool = false

    @Published var date = Date()
    @Published var weight = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    init(client: Client) {
        self.client = client
    }

    func saveProgressEntry() {
        if let weight = Double(weight) {
        print("Progress entries before + \(client.progressEntries)")
        let progressEntry = ProgressEntry(date: date, weight: weight)
        client.addProgressEntry(progressEntry)
        print("Progress entries after + \(client.progressEntries)")
        isAddingProgress = false
        }
    }

}



