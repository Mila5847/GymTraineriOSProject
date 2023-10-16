import Foundation

class ClientProgressViewModel: ObservableObject {
    @Published var client: Client
    
    init(client: Client) {
        self.client = client
    }
    
}

