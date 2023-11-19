import SwiftUI

struct CurrentClientsView: View {
    @ObservedObject var viewModel = CurrentClientsViewModel()
    @State private var isAddingClient = false
    @AppStorage("isDarkMode") private var isDark = false
    @Environment(\.presentationMode) var presentationMode

    init(){
        viewModel.getClients()
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Current Clients")
                    .font(.title)
                    .foregroundStyle(isDark ? .white : .black)
                Spacer()
                
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.clientsList) { client in
                            NavigationLink(
                                destination: ClientProgressView(viewModel: ClientProgressViewModel(client: client, currentClientsViewModel: viewModel)),
                                isActive: .constant(false),
                                label: {
                                    HStack {
                                        Text(client.name)
                                            .font(.system(size: 20, weight: .regular))
                                            .foregroundColor(isDark ? .white : .black)
                                            .padding()
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            // Remove the client from the view model and set isActive to false
                                            viewModel.deleteClient(client)
                                        }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing, 20)
                                        .font(.system(size: 20))
                                    }
                                }
                            )
                        }
                    }
                }
            }
            .background(Color(#colorLiteral(red: 0.6196078658, green: 0.7450980544, blue: 0.7725490332, alpha: 0.5)))
            .navigationBarBackButtonHidden(true)
                  .toolbar {
                      ToolbarItem(placement: .navigationBarLeading) {
                          HStack {
                              Image(systemName: "chevron.left.circle")
                                  .imageScale(.large)
                                  .foregroundColor(isDark ? .white : .black)
                                  .onTapGesture {
                                      presentationMode.wrappedValue.dismiss()
                                  }
                              Text("Back")
                                  .foregroundStyle(isDark ? .white : .black)
                          }
                      }
                  }
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
                            .foregroundColor(isDark ? .white : .black)
                    }.sheet(isPresented: $isAddingClient) {
                        // Present the AddClientView when isAddingClient is true
                        AddClientView(viewModelCurrentClient: viewModel)
                        }
                }
            }
        }
    }
}


