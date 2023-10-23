import SwiftUI

struct CurrentClientsView: View {
    @ObservedObject var viewModel: CurrentClientsViewModel
    @State private var isAddingClient = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Current Clients")
                            .font(.title)
                Spacer()
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.clients, id: \.id) { client in
                            NavigationLink(destination: ClientProgressView(viewModel: ClientProgressViewModel(client: client), viewModelCurrentClients: viewModel)) {
                                HStack {
                                    Text(client.name)
                                        .font(.system(size: 20, weight: .regular))
                                        .foregroundColor(.black)
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
            .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.8))) // Set the background color here
                       .navigationTitle("")
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
