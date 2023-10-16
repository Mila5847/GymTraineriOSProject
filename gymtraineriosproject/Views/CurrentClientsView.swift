import SwiftUI

struct CurrentClientsView: View {
    @ObservedObject var viewModel: CurrentClientsViewModel
    @State private var isAddingClient = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.clients, id: \.id) { client in
                            NavigationLink(destination: ClientProgressView(client: client)) {
                                HStack {
                                    Text(client.name)
                                        .font(.system(size: 20, weight: .regular))
                                        .padding()
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // Remove the client from the view model
                                        viewModel.removeClient(client)
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.red)
                                    }
                                    .padding(.trailing, 20)
                                    .font(.system(size: 20))
                                }
                            }
                        }

                    }
                }
            }
            .background(Color(red: 251 / 255.0, green: 203 / 255.0, blue: 124 / 255.0, opacity: 0.3))
            .navigationBarTitle("Current Clients")
            .onAppear {
                // Reset the flag when the view appears to enable navigation
                isAddingClient = false
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Set the flag to true to trigger the navigation
                        isAddingClient = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isAddingClient) {
                        // Present the AddClientView when isAddingClient is true
                        AddClientView(viewModelAddClient: viewModel.addClientViewModel, viewModelCurrentClient: viewModel)
                    }
                }
            }
            
        }
    }
}
