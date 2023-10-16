import Foundation

class ProgressEntryViewModel: ObservableObject {
    @Published var date = Date()
    @Published var weight = ""
}

struct ProgressEntry {
    var date: Date
    var weight: Double
}

