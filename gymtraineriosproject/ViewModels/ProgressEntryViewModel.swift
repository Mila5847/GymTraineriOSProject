import Foundation
import SwiftUI

struct ProgressEntry {
    var date: Date
    var weight: Double
}

import SwiftUI

class ProgressEntryViewModel: ObservableObject {
    @Published var client: Client
    @Published var isAddingProgress: Bool = false

    @Published var date = Date()
    @Published var weight = ""
    
    @Published var progressEntries: [ProgressEntry] = []

    init(client: Client) {
        self.client = client
    }

    /*func addProgressEntry(date: Date, weight: Double) {
        // Create a new progress entry and add it to the progressEntries array
        let newEntry = ProgressEntry(date: date, weight: weight)
        progressEntries.append(newEntry)
    }*/

    func saveProgressEntry() {
        if let weight = Double(weight) {
        let progressEntry = ProgressEntry(date: date, weight: weight)
        client.addProgressEntry(progressEntry)
        isAddingProgress = false
        }
    }
    
}

