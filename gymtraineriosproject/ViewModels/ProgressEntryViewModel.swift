import Foundation
import SwiftUI

struct ProgressEntry{
    var date: Date
    var weight: Double?
    
    init(date: Date, weight: Double) {
        self.date = date
        self.weight = weight
    }
}

class ProgressEntryViewModel: ObservableObject {
    @Published var client: Client
    @Published var isAddingProgress: Bool = false

    @Published var date = Date()
    @Published var weight: Double = 0.0
    
    @Environment(\.presentationMode) var presentationMode
    
    init(client: Client) {
        self.client = client
    }

    func addProgressEntry(newEntry: ProgressEntry) {
        print("Progress entries before + \(client.progressEntries)")
        client.addProgressEntry(newEntry)
        print("Progress entries after + \(client.progressEntries)")
        isAddingProgress = false
        
    }

}



