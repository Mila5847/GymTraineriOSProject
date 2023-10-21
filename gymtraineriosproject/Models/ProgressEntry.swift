import Foundation

struct ProgressEntry {
    var date: Date
    var weight: Double?
    
    init(date:Date, weight: Double){
        self.date = date
        self.weight = weight
    }
}
